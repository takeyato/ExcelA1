Dim previousWorkbooks As Collection

Sub CheckWorkbooks()
    Dim wb As Workbook
    Dim wbName As Variant
    Dim currentWorkbooks As Collection
    Set currentWorkbooks = New Collection
    
    ' 現在開いているブックを収集
    For Each wb In Application.Workbooks
        currentWorkbooks.Add wb.Name
    Next wb
    
    ' 初回実行時にpreviousWorkbooksを初期化
    If previousWorkbooks Is Nothing Then
        Set previousWorkbooks = New Collection
        For Each wbName In currentWorkbooks
            previousWorkbooks.Add wbName
        Next wbName
    End If
    
    ' 閉じられたブックをチェック
    For Each wbName In previousWorkbooks
        On Error Resume Next
        currentWorkbooks.Item wbName
        If Err.Number <> 0 Then
            ' 閉じられたブックに対する処理
            MsgBox "ブックが閉じられました: " & wbName
            ' 実行したい処理をここに追加
        End If
        On Error GoTo 0
    Next wbName
    
    ' 次のチェックのためにpreviousWorkbooksを更新
    Set previousWorkbooks = currentWorkbooks
    
    ' 再度タイマーをセット
    Application.OnTime Now + TimeValue("00:00:10"), "CheckWorkbooks"
End Sub
