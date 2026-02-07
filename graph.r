plot_data <- final_results %>%
  pivot_longer(cols = c("Parameter_RMSE", "Classification_Accuracy", "Cohen_Kappa"), 
               names_to = "Metric",
               values_to = "Value") %>%
  mutate(Metric_Label = case_when(
    Metric == "Parameter_RMSE" ~ "Parameter Bias (RMSE)",
    Metric == "Classification_Accuracy" ~ "Accuracy (Hit Rate)",
    Metric == "Cohen_Kappa" ~ "Cohen's Kappa (Reliability) " 
  ))

p <- ggplot(plot_data, aes(x = Misspecification, y = Value, color = Metric_Label, shape = Metric_Label, group = Metric_Label)) +
  geom_line(size = 1.2) +
  geom_point(size = 3.5) +
  scale_color_manual(values = c("gray70", "#2E86C1", "#E74C3C")) + 
  scale_x_continuous(labels = scales::percent) +
  scale_y_continuous(limits = c(0, 1), breaks = seq(0, 1, 0.1)) + 
  labs(title = "Robustness Analysis: Kappa vs. Accuracy vs. Bias",
       subtitle = paste0("Simulation based on DINA Model (N=", N, ", J=", J, ", K=", K, ")"),
       x = "Q-Matrix Misspecification Rate (Error %)",
       y = "Value",
       color = "Metric",
       shape = "Metric") +
  theme_minimal() +
  theme(legend.position = "bottom",
        legend.title = element_blank(),
        plot.title = element_text(face = "bold", size = 14))

print(p)
