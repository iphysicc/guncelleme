function Write-BigLetter {
    param (
        [string]$letter,
        [int]$x,
        [int]$y
    )

    $bigLetters = @{
        'S' = @"
 @@@@@@ 
@@    @@
@@      
 @@@@@  
      @@
@@    @@
 @@@@@@ 
"@
        'P' = @"
@@@@@@@
@@    @@
@@    @@
@@@@@@@
@@     
@@     
@@     
"@
        'A' = @"
  @@@@  
 @@  @@ 
@@    @@
@@@@@@@@
@@    @@
@@    @@
@@    @@
"@
        'R' = @"
@@@@@@@
@@    @@
@@    @@
@@@@@@@
@@  @@ 
@@   @@
@@    @@
"@
        'O' = @"
 @@@@@@ 
@@    @@
@@    @@
@@    @@
@@    @@
@@    @@
 @@@@@@ 
"@
        'W' = @"
@@    @@
@@    @@
@@    @@
@@ @@ @@
@@@@@@@@ 
@@    @@
@@    @@
"@
    }

    $lines = $bigLetters[$letter] -split "`n"
    for ($i = 0; $i -lt $lines.Length; $i++) {
        try {
            [Console]::SetCursorPosition($x, $y + $i)
            Write-Host $lines[$i] -ForegroundColor Yellow -NoNewline
        } catch {
        }
    }
}

function Animate-Sparrow {
    $word = "SPARROW"
    $consoleWidth = $Host.UI.RawUI.WindowSize.Width
    $consoleHeight = $Host.UI.RawUI.WindowSize.Height
    $letterWidth = 8
    $letterHeight = 7
    $wordWidth = $letterWidth * $word.Length
    $startX = [Math]::Max(0, ($consoleWidth - $wordWidth) / 2)
    $startY = [Math]::Max(0, ($consoleHeight - $letterHeight) / 2)

    Clear-Host

    for ($index = 0; $index -lt $word.Length; $index++) {
        $letter = $word[$index]
        $x = $startX + ($index * $letterWidth)
        Write-BigLetter $letter $x $startY
        Start-Sleep -Milliseconds 300
    }

    Start-Sleep -Seconds 1

    for ($i = 0; $i -lt 3; $i++) {
        foreach ($color in @("Red", "Green", "Blue", "Magenta", "Cyan", "White")) {
            for ($index = 0; $index -lt $word.Length; $index++) {
                $letter = $word[$index]
                $x = $startX + ($index * $letterWidth)
                try {
                    [Console]::ForegroundColor = $color
                    Write-BigLetter $letter $x $startY
                } catch {
                    
                }
            }
            Start-Sleep -Milliseconds 200
        }
    }
}


Animate-Sparrow
