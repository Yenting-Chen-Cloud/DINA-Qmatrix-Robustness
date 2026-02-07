# 1.1 constants of Simulation
set.seed(2026) 
N <- 10000
J <- 30
K <- 4 
Model <- "DINA" 
misspec_rates <- c(0, 0.05, 0.10, 0.20, 0.30, 0.40, 0.50, 0.70) 

# 1.2 Q Mat specification
Q_true <- matrix(0, nrow = J, ncol = K)
Q_true[1:K, ] <- diag(K)
for(j in (K+1):J){
  num_atts <- sample(1:3, 1)
  Q_true[j, sample(1:K, num_atts)] <- 1
}

# 1.3 parameters of specified model
gs_true <- runif(J, 0.05, 0.3) # Guess
ss_true <- runif(J, 0.05, 0.3) # Slip
gs_frame <- matrix(data = c(gs_true, ss_true), nrow = 30, ncol = 2)

# 1.4 True attribute profile & response data
sim_data <- simGDINA(N = N, Q = Q_true, gs.parm = gs_frame, model = "DINA")
dat <- sim_data$dat
alpha_true <- sim_data$attribute

# 2. Simulations of Robustness under misspecified Q matrix
results_list <- list() 

for (rate in misspec_rates) {
  cat(paste("Undergoing the misspecification rate = :", rate * 100, "%\n"))

  Q_mis <- Q_true
  if (rate > 0) {
    modifiable_indices <- which(row(Q_true) > K) 
    n_changes <- floor(length(modifiable_indices) * rate) 
    change_pos <- sample(modifiable_indices, n_changes) 
    Q_mis[change_pos] <- 1 - Q_mis[change_pos] 
    
    row_sums <- rowSums(Q_mis)
    zero_rows <- which(row_sums == 0)
    if(length(zero_rows) > 0){
      for(zr in zero_rows){
        Q_mis[zr, sample(1:K, 1)] <- 1
      }
    }
  }
  

  est_model <- GDINA(dat = dat, Q = Q_mis, model = "DINA", verbose = 0)
  coefs <- coef(est_model, what = "gs")
  g_est <- coefs[, "guessing"]
  s_est <- coefs[, "slip"]

  rmse_g <- sqrt(mean((g_est - gs_true)^2))
  rmse_s <- sqrt(mean((s_est - ss_true)^2))
  mean_param_bias <- (rmse_g + rmse_s) / 2

  person_est <- personparm(est_model, what = "MAP") 
  
  # Attribute-level Hit Rate
  hit_rate <- mean(alpha_true == person_est)
  # Kappa
  kappas <- sapply(1:K, function(k) {
    get_kappa(alpha_true[, k], person_est[, k])
  })
  mean_kappa <- mean(kappas)

  results_list[[paste0(rate)]] <- data.frame(
    Misspecification = rate,
    Parameter_RMSE = mean_param_bias,
    Classification_Accuracy = hit_rate,
    Cohen_Kappa = mean_kappa
  )
}

# 3. Result (Chart)
final_results <- bind_rows(results_list)
