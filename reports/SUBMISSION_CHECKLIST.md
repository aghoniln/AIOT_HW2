# HW2 繳交對照清單

核對日期：2026-10-28（臺灣時間）。依使用者提供的「HW2: Multiple Linear regression | iLearning 3.0」四頁作業說明核對；文件列繳交期限為 2026-10-28，未列出確切截止時刻。

## 主要繳交連結

- GitHub：https://github.com/aghoniln/AIOT_HW2
- 公開網站：https://hw2-regression-lab-aghoniln.fhjhegoa.chatgpt.site/
- 實驗報告：[RESULTS.md](RESULTS.md)

## 要求與成果

| 作業要求 | 狀態 | 對應成果 |
|---|---|---|
| Kaggle 公開資料、14–39 個輸入特徵，不含目標 | 已完成 | 洪水 20 個、汽車 23 個原始輸入特徵；README 附來源與排除欄位 |
| 線性回歸預測 | 已完成 | `regression_core.py`、實際模型輸出及線上新樣本預測 |
| Feature Selection | 已完成 | 全特徵 OLS 與 Group RFE 的五折 CV 比較 |
| Model Evaluation | 已完成 | MAE、MSE、RMSE、R²、訓練調整後 R²、平均值基準 |
| 預測圖加信賴／預測區間 | 已完成 | 網站預測區間圖、報告預測 CSV；新樣本 CI 與 PI |
| CRISP-DM 六階段 | 已完成 | `RESULTS.md` 與網站 CRISP-DM 頁籤 |
| 明確標示 GPT 輔助內容 | 已完成 | `AI_DISCLOSURE.md`、報告與網站 AI 頁籤 |
| NotebookLM 研究同主題解法，摘要超過 100 字 | 已完成 | `NOTEBOOKLM_SUMMARY.md`；實際匯入五個來源並取得回覆、附來源與查核 |
| GitHub 與可操作網頁 | 已完成 | 上方兩個主要繳交連結；網站為免登入公開版 |
| 下拉選單呈現兩種 problem（加分項） | 已完成 | 洪水機率／汽車價格切換 |
| 任意輸入 Dataset（加分項） | 已完成 | CSV 上傳與公開 HTTPS CSV 網址；瀏覽器來源需允許 CORS，否則下載後上傳 |
| 全部相關 ChatGPT 對話匯出 PDF | 待帳號持有人匯出 | 目前瀏覽器未登入 ChatGPT，無法取得帳號內完整對話；不能以摘要冒充完整逐字紀錄 |
| 在 iLearning 實際按下繳交 | 尚未操作 | 本次準備及公開交付成果，尚未代為提交 LMS |

作業「AI 協助要求」段落要求匯出全部對話 PDF，但「繳交內容／評分標準」又將對話、資訊圖表及報告列為 optional。本清單保留 PDF 待完成狀態，避免將這項歧義當成已完成的證據。

## 建議展示順序

1. 打開公開網站，先展示洪水的來源、20 個特徵及測試指標。
2. 開啟「特徵與模型」，解釋以訓練 CV 選模型，以及特徵減少不保證較佳。
3. 展示 95% 預測區間與新樣本輸入，說明 PI 是個別新觀測的不確定性。
4. 切換汽車題目，展示 23 個原始特徵、類別編碼與小樣本限制。
5. 進入自訂 CSV，使用老師的 50_Startups.csv 示範；其特徵數不符合主要資料條件，應維持示範模式標示。
6. 展示「CRISP-DM」與「AI 與繳交」，最後提供 GitHub、實驗報告及 NotebookLM 摘要。

## 對話 PDF 的最後補件

由帳號持有人開啟本次作業的完整 ChatGPT 對話，使用瀏覽器列印或課堂指定方法匯出 PDF，逐頁檢查程式區塊與圖表。可將 PDF 作為 LMS 附件；若上傳公開 GitHub，請先確認只包含要公開的作業內容。`AI_DISCLOSURE.md` 僅為使用揭露，不等於完整對話。
