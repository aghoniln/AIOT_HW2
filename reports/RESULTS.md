# HW2 多元線性回歸實驗報告

本文件由實際執行產生；種子 42，80/20 切分，訓練集五折交叉驗證。

## 洪水機率預測

來源：https://www.kaggle.com/datasets/naiyakhalid/flood-prediction-dataset

以 20 個環境與管理因素預測洪水機率。從 Kaggle 壓縮檔的 train.csv 固定種子 42 抽樣 50,000 筆，排除 id。原檔 1,117,957 筆；採樣僅為降低互動運算成本。合成資料，只作課堂方法展示。

### Business Understanding

探索環境風險因素與洪水機率的關係，建立可解釋的課堂回歸模型。此合成資料模型不適合作為真實災害預警依據。

### Data Understanding

50,000 筆、20 個有效原始輸入特徵；目標 FloodProbability。缺失儲存格 0。

### Data Preparation

排除 ['id']；先移除目標缺失與完全重複觀測，再切分為訓練 40,000 筆、測試 10,000 筆。補值、編碼、標準化及 RFE 在各訓練折內擬合。

### Modeling

使用 OLS，比較全特徵與 Group RFE。類別變數的 dummy 欄位視為同一原始特徵群組。

| 模型 | 原始特徵數 | CV RMSE | CV RMSE 標準差 | CV R² |
|---|---:|---:|---:|---:|
| 全特徵 OLS | 20 | 0.0200581 | 0.000214032 | 0.845382 |
| Group RFE：14 特徵 | 14 | 0.0342036 | 0.000417593 | 0.550471 |
| Group RFE：16 特徵 | 16 | 0.0304015 | 0.000277924 | 0.644861 |
| Group RFE：18 特徵 | 18 | 0.0258853 | 0.000250355 | 0.742535 |

最終模型：**全特徵 OLS**，依訓練 CV RMSE 決定，未用測試集調參。

RFE 保留：TopographyDrainage、RiverManagement、Deforestation、Urbanization、ClimateChange、DamsQuality、Siltation、AgriculturalPractices、Encroachments、IneffectiveDisasterPreparedness、DrainageSystems、CoastalVulnerability、Landslides、Watersheds、PopulationScore、WetlandLoss、InadequatePlanning、PoliticalFactors

### Evaluation

| 模型 | MAE | MSE | RMSE | R² | 訓練調整後 R² | 測試 PI 覆蓋率 |
|---|---:|---:|---:|---:|---:|---:|
| 全特徵 OLS | 0.0157534 | 0.000396979 | 0.0199243 | 0.848246 | 0.845553 | 94.53% |
| Group RFE：18 特徵 | 0.0207085 | 0.000659529 | 0.0256813 | 0.747879 | 0.746608 | 95.79% |

平均值基準 RMSE：0.05115。

模型診斷：`{"Jarque_Bera_p": 0.0, "Breusch_Pagan_p": 0.0, "design_rank": 21, "design_columns": 21, "residual_df": 39979, "condition_number": 1.1474363101241798, "dependent_encoded_columns_removed": 0, "independence": "須依資料取得方式判斷；隨機列順序無法證明獨立性。"}`

圖表：`flood/prediction_interval.html`；完整結果：`flood/predictions.csv`。

95% PI 描述個別新觀測的不確定性，CI 描述平均反應的不確定性。這些是條件於已選模型的傳統 OLS 區間，未納入特徵選擇不確定性。JB/BP 與殘差圖用於檢查假設，違反假設時名目覆蓋率可能不成立。

### Deployment

公開網站：https://hw2-regression-lab-aghoniln.freshplum4098.chatgpt.site/ 。網站提供兩種題目、資料預覽、特徵與模型比較、圖表、新樣本及批次預測。GitHub：https://github.com/aghoniln/AIOT_HW2 ，附可重現實驗的 Python / Streamlit 程式。

## 汽車價格預測

來源：https://www.kaggle.com/datasets/hellbuoy/car-price-prediction

以引擎、尺寸、油耗及車身類型等 23 個原始特徵預測價格；排除 car_ID 與高基數完整車名 CarName。類別編碼後欄數可能超過 39，原始特徵數另行呈現。

### Business Understanding

研究車輛規格與價格的關係，作為歷史樣本的估價練習。205 筆樣本較少，不代表目前市場行情。

### Data Understanding

205 筆、23 個有效原始輸入特徵；目標 price。缺失儲存格 0。

### Data Preparation

排除 ['car_ID', 'CarName']；先移除目標缺失與完全重複觀測，再切分為訓練 163 筆、測試 41 筆。補值、編碼、標準化及 RFE 在各訓練折內擬合。

### Modeling

使用 OLS，比較全特徵與 Group RFE。類別變數的 dummy 欄位視為同一原始特徵群組。

| 模型 | 原始特徵數 | CV RMSE | CV RMSE 標準差 | CV R² |
|---|---:|---:|---:|---:|
| 全特徵 OLS | 23 | 3016.17 | 969.16 | 0.812094 |
| Group RFE：14 特徵 | 14 | 3282.01 | 1273.28 | 0.782861 |
| Group RFE：16 特徵 | 16 | 3077.52 | 1155.68 | 0.805641 |
| Group RFE：18 特徵 | 18 | 3047.8 | 1102.75 | 0.810144 |
| Group RFE：21 特徵 | 21 | 3024.28 | 996.684 | 0.811919 |

最終模型：**全特徵 OLS**，依訓練 CV RMSE 決定，未用測試集調參。

RFE 保留：symboling、fueltype、aspiration、doornumber、carbody、drivewheel、enginelocation、wheelbase、carlength、carwidth、curbweight、enginetype、cylindernumber、enginesize、fuelsystem、boreratio、stroke、compressionratio、peakrpm、citympg、highwaympg

### Evaluation

| 模型 | MAE | MSE | RMSE | R² | 訓練調整後 R² | 測試 PI 覆蓋率 |
|---|---:|---:|---:|---:|---:|---:|
| 全特徵 OLS | 2251.87 | 9.45268e+06 | 3074.52 | 0.884096 | 0.934431 | 90.24% |
| Group RFE：21 特徵 | 2274.09 | 9.49069e+06 | 3080.7 | 0.88363 | 0.935424 | 87.80% |

平均值基準 RMSE：9234.91。

模型診斷：`{"Jarque_Bera_p": 0.05024971935316906, "Breusch_Pagan_p": 0.00015990162856286725, "design_rank": 40, "design_columns": 40, "residual_df": 123, "condition_number": 59.26094023784187, "dependent_encoded_columns_removed": 2, "independence": "須依資料取得方式判斷；隨機列順序無法證明獨立性。"}`

圖表：`cars/prediction_interval.html`；完整結果：`cars/predictions.csv`。

95% PI 描述個別新觀測的不確定性，CI 描述平均反應的不確定性。這些是條件於已選模型的傳統 OLS 區間，未納入特徵選擇不確定性。JB/BP 與殘差圖用於檢查假設，違反假設時名目覆蓋率可能不成立。

### Deployment

公開網站：https://hw2-regression-lab-aghoniln.freshplum4098.chatgpt.site/ 。網站提供兩種題目、資料預覽、特徵與模型比較、圖表、新樣本及批次預測。GitHub：https://github.com/aghoniln/AIOT_HW2 ，附可重現實驗的 Python / Streamlit 程式。

## 結論與限制

特徵較少不保證比較好，應以訓練交叉驗證決定；測試集只負責最後評估。洪水資料是合成資料，表現不能外推到真實災害；汽車樣本僅 205 筆，且部分特徵共線、類別稀少。模型係數為關聯而非因果，外插時誤差可能增加。

### GPT 輔助內容

本專案使用 ChatGPT 協助理解作業要求、規劃 CRISP-DM 分析流程、撰寫與除錯 Python / Streamlit 程式、設計特徵選擇與交叉驗證、製作圖表及整理說明文字。模型指標由程式實際讀取 Kaggle CSV 並訓練後計算，未以文字生成或預設數值代替實驗結果。

學生應實際執行程式、確認資料來源與輸出、理解結果限制並負責最後繳交。NotebookLM 已於 2026-10-28 實際匯入五個來源並產生研究摘要，ChatGPT 協助操作、追問與核對；詳見 NOTEBOOKLM_SUMMARY.md。摘要包含來源、引註限制及本專案採用方式。完整聊天紀錄 PDF 仍為獨立證據，不能用摘要或 AI 使用揭露代替。

### 對話 PDF

請在 ChatGPT 中將此次作業的完整相關對話透過瀏覽器列印、pdfCrowd 或其他可用方法匯出 PDF，確認程式碼與圖表沒有被截斷。此專案附有 AI 使用揭露，尚未包含完整聊天紀錄的 PDF 匯出。

目前可用瀏覽器未登入 ChatGPT，無法取得帳號內完整歷史對話；此項維持待完成，由帳號持有人匯出後補件。


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
