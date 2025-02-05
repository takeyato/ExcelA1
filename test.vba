Private Sub Workbook_BeforeClose(Cancel As Boolean)
    Dim wb As Workbook
    For Each wb In Application.Workbooks
        ' マクロが書かれているブック以外が閉じられる場合
        If wb.Name <> ThisWorkbook.Name Then
            ' ここに実行したいコードを追加します
            MsgBox "閉じられたブックの名前: " & wb.Name
        End If
    Next wb
End Sub
