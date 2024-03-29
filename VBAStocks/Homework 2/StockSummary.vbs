Sub StockSummary():
    
    
    Dim ws As Worksheet
    Dim i As Long
    Dim RowNum As Long
    Dim RunTot As Double
    Dim PasteOffset As Integer
    PasteOffset = 2
    Dim OpenPrice As Double
    Dim ClosePrice As Double
    Dim PctChg As Double
    Dim FirstTime As Integer
    FirstTime = 0
    Dim YrChg As Double

    For Each ws In Worksheets
        ws.Cells(1, 9).Value = "<Ticker>"
        ws.Cells(1, 10).Value = "<Yearly Change>"
        ws.Cells(1, 11).Value = "<Percent Change>"
        ws.Cells(1, 12).Value = "<Total Volume>"
        RowNum = ws.Cells(Rows.Count, 1).End(xlUp).Row

        For i = 2 To RowNum

            If ws.Cells(i, 1) = ws.Cells(i, 1).Offset(1, 0) Then
                FirstTime = FirstTime + 1
                RunTot = RunTot + ws.Cells(i, 7)
                If FirstTime = 1 Then
                    OpenPrice = ws.Cells(i, 3)
                Else
                End If
            Else
                RunTot = RunTot + ws.Cells(i, 7)
                ws.Cells(PasteOffset, 9) = ws.Cells(i, 1)
                ws.Cells(PasteOffset, 12) = RunTot
                ClosePrice = ws.Cells(i, 6)
                
                If OpenPrice <> 0 Then
                    PctChg = ((ClosePrice - OpenPrice) / OpenPrice)
                    YrChg = ClosePrice - OpenPrice
                Else
                    PctChg = 0
                    YrChg = 0
                End If
                ws.Cells(PasteOffset, 11) = PctChg
                ws.Cells(PasteOffset, 11).NumberFormat = "0.00%"
                ws.Cells(PasteOffset, 10) = YrChg
                    If ws.Cells(PasteOffset, 10).Value > 0 Then
                        ws.Cells(PasteOffset, 10).Interior.ColorIndex = 4
                    Else
                        ws.Cells(PasteOffset, 10).Interior.ColorIndex = 3
                    End If
                RunTot = 0
                PasteOffset = PasteOffset + 1
                FirstTime = 0
            End If
        Next i
    PasteOffset = 2
    Next ws
End Sub


