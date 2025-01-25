# Excelアプリケーションを取得
$excel = New-Object -ComObject Excel.Application

# PowerShellを終了せずに待機状態にするために、無限ループを使用
while ($true) {
    # 現在開かれているすべてのワークブックを取得
    $workbooks = $excel.Workbooks
    $workbookCount = $workbooks.Count
    
    if ($workbookCount -gt 1) {
        for ($i = $workbookCount; $i -gt 1; $i--) {
            $workbook = $workbooks.Item($i)
            
            # ユーザーに確認ポップアップを表示
            $confirm = [System.Windows.Forms.MessageBox]::Show("Do you want to save and close the workbook?", "Confirmation", [System.Windows.Forms.MessageBoxButtons]::OKCancel, [System.Windows.Forms.MessageBoxIcon]::Question)
            
            if ($confirm -eq [System.Windows.Forms.DialogResult]::OK) {
                # すべてのシートのA1セルを選択
                foreach ($sheet in $workbook.Sheets) {
                    $sheet.Activate()
                    $sheet.Cells.Item(1,1).Select()
                }
                
                # ワークブックを保存して閉じる
                $workbook.Save()
                $workbook.Close($false)
            }
        }
    }
    
    # 一定時間待機 (例: 5秒)
    Start-Sleep -Seconds 5
}

# 必要な場合、System.Windows.Formsアセンブリを追加
Add-Type -AssemblyName System.Windows.Forms
