Private Sub Workbook_Open()
    ' 定期的にブックの状態を監視するタイマーをセット
    Application.OnTime Now + TimeValue("00:00:10"), "CheckWorkbooks"
End Sub

Private Sub Workbook_BeforeClose(Cancel As Boolean)
    ' アプリケーション終了時にタイマーを停止
    On Error Resume Next
    Application.OnTime EarliestTime:=Now + TimeValue("00:00:10"), Procedure:="CheckWorkbooks", Schedule:=False
    On Error GoTo 0
End Sub
