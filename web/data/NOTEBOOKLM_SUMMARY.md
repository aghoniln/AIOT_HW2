### NotebookLM 摘要

研究日期：2026-10-28（臺灣時間）。本節為實際透過 NotebookLM 加入五個網路來源、提問與追問後取得的摘要。頁面目前顯示服務名稱為 Gemini Notebook；保留作業要求的「NotebookLM 摘要」標題。

公開報告已附摘要與所有來源，閱卷者可直接閱讀。本節的 N 編號對應回覆畫面可見的引用按鈕，其他折疊引用未逐一匯出。

#### 實際回覆文字

> 第二份 Kaggle 筆記係採用 301 筆車款資料，僅能作為多元線性回歸之方法學比較，不可直接套用為本作業 205 筆資料之實驗數據 [N1][N2]。為避免資料洩漏，缺失值補值、類別編碼與數值縮放皆須嚴格於訓練集內進行 fit，且不得利用目標價格預先劃分品牌等級，亦不可任意剔除分數較差之 CV 折數 [N3]。特徵選擇可透過 RFE 遞歸消除不重要變數，並結合訓練集內之交叉驗證（CV）評估穩定度，最後以獨立保留之測試集計算 MAE、RMSE 與 R² 作為客觀評估指標 [N4]。在統計推論方面，殘差常態性與同變異性為傳統 OLS 推論與區間估計的前提假設，非算出 OLS 係數點估計之必要條件，且殘差直方圖並不能證明常態 [N10]。進行價格預測時，應區分平均反應信賴區間（CI）與新觀測預測區間（PI），後者因額外涵蓋個體觀測變異數，其範圍必然較 CI 寬廣 [N13]。

#### 來源與引註對照

| 來源 | 標題與連結 | 摘要中可見的原始引註 |
|---|---|---|
| S1 | [Shalini Goyal：Car Price Prediction (Linear Regression - RFE)](https://www.kaggle.com/code/goyalshalini93/car-price-prediction-linear-regression-rfe) | N1、N10 |
| S2 | [Parnian Malekian：Multiple linear regression on cars data](https://www.kaggle.com/code/parnianmalekian/multiple-linear-regression-on-cars-data) | N2 |
| S3 | [scikit-learn：Common pitfalls and recommended practices](https://scikit-learn.org/stable/common_pitfalls.html) | N3、N4 |
| S4 | [scikit-learn：Feature selection](https://scikit-learn.org/stable/modules/feature_selection.html) | 已匯入；補充核對 RFE／RFECV 方法 |
| S5 | [statsmodels：Ordinary Least Squares](https://www.statsmodels.org/stable/examples/notebooks/generated/ols.html) | N13 |

#### 查核與本專案採用方式（GPT 協助整理）

1. 在 NotebookLM 的來源檢視中核對 S1 確實包含 `CarPrice_Assignment.csv`、205 × 26 的資料形狀與 `RFE(lm, 10)`。本作業使用相同主題資料，但排除 ID 與完整車名後保留 23 個原始特徵；不照搬其分數。
2. S1 使用個別編碼欄位 RFE；本專案以同一原始欄位的編碼欄為群組執行 Group RFE，於各訓練折重新選擇，避免把類別欄拆開計算原始特徵數。這是本專案的實作選擇。
3. 在 S1 來源中可見測試資料重新 `fit_transform` 與以價格建立 `carsrange` 的寫法。本專案依 S3 的訓練／測試隔離原則，僅在訓練折擬合前處理，未採用由全部資料目標價格建構的品牌級距。這項風險判斷是查核後的分析。
4. 摘要的 N10 引至 Kaggle 範例，不能單憑該引用支持全部推論敘述；另以 S5 的 OLS 範例及本程式實際區間計算核對。CI 與 PI 的寬度比較限於同一模型、同一輸入及相同信心水準；零誤差等退化情形可能相等。
5. 常態性是傳統有限樣本常態誤差推論的條件之一，不是計算最小平方係數的必要條件；異變異下仍可計算 OLS，但傳統標準誤與區間可能不適用。殘差圖與檢定提供診斷，無法證明所有假設成立。
6. 本專案保留全部五折結果，以訓練集 CV RMSE 選擇模型，最後回報保留測試集的 MAE、RMSE、R² 與 PI 覆蓋率。S2 使用不同資料，僅比較流程，未作本作業資料或成效證據。

#### 研究過程

先請 NotebookLM 比較兩份 Kaggle 解法、官方特徵選擇與防資料洩漏文件，以及 OLS 區間；再追問資料集差異、CV 完整性與推論假設，取得上述實際回覆並儲存為「HW2 NotebookLM 摘要｜已核對來源」記事。原始可見文字已於整理時核對；公開版本保留摘要與來源對照。

NotebookLM 的初稿及本次追問皆由 ChatGPT 協助操作與核對；本節沒有宣稱是學生獨立撰寫，也不將網路 Notebook 的結果當成本作業的實驗結果。
