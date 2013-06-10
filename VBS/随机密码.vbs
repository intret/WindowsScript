'Author: Demon
'Website: http://demon.tw
'Date: 2012/6/21
Function GeneratePassword(length)
    Dim p, s, i, l
    s = "abcdefghijklmnopqrstuvwxyz" &_
        "ABCDEFGHIJKLMNOPQRSTUVWXYZ" &_
        "0123456789" & "!@#$%^&*()"
    Randomize : l = Len(s)
    For i = 1 To length
        p = p & Mid(s, Int(Rnd * l + 1) ,1)
    Next
    GeneratePassword = p
End Function

WScript.Echo GeneratePassword(12)