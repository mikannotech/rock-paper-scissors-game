$choices = @("グー", "チョキ", "パー")

function Get-PlayerChoice {
    while ($true) {
        $input = Read-Host -Prompt "グー, チョキ, パー から１つ選んで入力してください"
        if ($choices -contains $input) {
            return $input
        } else {
            Write-Host "エラー: 無効な入力です。グー、チョキ、パーのいずれかを入力してください。"
        }
    }
}

function Get-ComputerChoice {
    $randomIndex = Get-Random -Minimum 0 -Maximum $choices.Length
    return $choices[$randomIndex]
}

function Determine-Winner {
    param (
        [string]$playerChoice,
        [string]$computerChoice
    )
 
    if ($playerChoice -eq $computerChoice) {
        return "引き分け"
    } else {
        switch ($playerChoice) {
            "グー" {
                if ($computerChoice -eq "チョキ") {
                    return "プレイヤーの勝ち"
                } else {
                    return "コンピューターの勝ち"
                }
            }
            "チョキ" {
                if ($computerChoice -eq "パー") {
                    return "プレイヤーの勝ち"
                } else {
                    return "コンピューターの勝ち"
                }
            }
            "パー" {
                if ($computerChoice -eq "グー") {
                    return "プレイヤーの勝ち"
                } else {
                    return "コンピューターの勝ち"
                }
            }
        }
    }
}

# ゲームの流れ
$playerChoice = Get-PlayerChoice
$computerChoice = Get-ComputerChoice

Write-Host "プレイヤーの手は $playerChoice です"
Write-Host "コンピューターの手は $computerChoice です"

$result = Determine-Winner -playerChoice $playerChoice -computerChoice $computerChoice
Write-Host "結果: $result"