# A Theoretical Note on the Asymptotic Robustness of the DINA Model Under Q-Matrix Misspecification

## 概覽 / Overview
本專案包含預計投稿研究論文預印本、相關 R 語言實作代碼。本研究探討在 Q 矩陣誤編下，DINA 模型參數估計的偏誤方向性，以及其在屬性分類上的漸近穩健性。

This project contains the preprint of a research paper and the associated R code for implementation. This study investigates the directionality of parameter bias and the asymptotic robustness of attribute classification in the DINA model under Q-matrix misspecification.

---

## 授權聲明 / Licensing Notice
**重要說明：** 本專案所有內容自 **2026 年 2 月 7 日** 起正式採用 **CC BY 4.0** 授權釋出。
**Important:** All contents in this project are formally licensed under **CC BY 4.0** as of **February 7, 2026**.

- 您可以自由分享與修改內容，但必須標示作者姓名並提供來源連結。
- You are free to share and adapt the material, provided that appropriate credit is given.

---

## 內容說明與更新日誌 / Contents & Update Log
1. **Manuscript (PDF)**: [2026_DINA_Qmatrix_Robustness_Chen.pdf](./2026_DINA_Qmatrix_Robustness_Chen.pdf)
   - 論文預印本 / Preprint version.
   - **2026-02-02**: 上傳初稿 (V1) / Uploaded initial draft.
2. **R-Code**:
   - 統計方法實作腳本（包含蒙地卡羅模擬與圖表繪製）/ R scripts for implementation.
   - **2026-02-06**: 修正模擬腳本與優化視覺化代碼 / Refined simulation scripts and optimized code.
3. **Supplementary Data**: 
   - 包含模擬結果 CSV 檔。

---

## 程式碼說明 / Code Structure
為了提升可讀性與維護性，本研究之 R 實作代碼已拆分為以下模組：
To enhance readability and maintainability, the R implementation scripts for this study have been organized into the following modules:

1. **[DINA_Robustness_Simulation_Main.r](./DINA_Robustness_Simulation_Main.r)**: 
   - **主執行程式 / Main Script**. 
   - 負責整合所有模組並執行蒙地卡羅模擬核心流程。
   - Coordinates all modules and executes the core Monte Carlo simulation workflow.
2. **[functions.r](./functions.r)**: 
   - **自定義函數 / Custom Functions**.
   - 存放計算屬性一致性（如 Cohen's Kappa）之函數。
   - Contains functions for calculating attribute consistency (e.g., Cohen's Kappa).
3. **[graph.r](./graph.r)**: 
   - **繪圖與視覺化 / Visualization**.
   - 負責處理模擬結果之資料清理與使用 `ggplot2` 繪製穩健性分析圖表。
   - Handles data cleaning of simulation results and generates robustness analysis plots using `ggplot2`.
4. **[packages.r](./packages.r)**: 
   - **環境配置 / Environment Setup**.
   - 自動偵測並安裝研究所需之 R 套件（如 `GDINA`, `tidyverse`）。
   - Automatically detects and installs required R packages (e.g., `GDINA`, `tidyverse`).

## 執行順序 / Execution Order
建議依照以下順序執行： `packages.r`,`functions.r`,`DINA_Robustness_Simulation_Main.r`,`graph.r`。

Please execute with the following order:  `packages.r`,`functions.r`,`DINA_Robustness_Simulation_Main.r`,`graph.r` .

---

## 如何引用 / How to Cite
如果您使用了本專案的代碼或資料，請參考以下方式引用：
If you use the code or materials from this project, please cite as follows:

Chen, Y.-T., & Shih, C.-L. (2026). A Theoretical Note on the Asymptotic Robustness of the DINA Model Under Q-Matrix Misspecification. Retrieved from [PsyArXiv Link]

---

## 聯絡資訊 / Contact
作者 / Author: Yen-Ting Chen (國立中山大學教育研究所 / National Sun Yat-sen University)
Email: d146050002@nsysu.edu.tw

作者 / Author: Dr.Ching-Lin Shih (國立中山大學教育研究所 / National Sun Yat-sen University)
Email: educls@mail.nsysu.edu.tw
