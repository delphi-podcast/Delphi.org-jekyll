
# find-shortcodes.ps1

# --- Configuration ---
$TargetDirectory = "."  # Search the current directory and all subdirectories
$OutputFile = "_scripts/shortcode_report.txt"

# --- Targeted Regular Expression Pattern ---
# This pattern looks for:
# 1. The opening tag of a few common shortcodes: [caption parameters] or [video parameters]
# 2. The corresponding closing tag: [/caption]
# We use alternation (|) to look for any of these names.
$ShortcodePattern = "\[(caption|gallery|audio|video|embed|code|sourcecode|list|ul|ol|col|row)[\s][^\]]*\]|\[/(caption|gallery|audio|video|embed|code|sourcecode|list|ul|ol|col|row)\]"
# NOTE: The "[\s]" forces the pattern to only match if the shortcode name is followed by a space (i.e., parameters), reducing false positives.

# Clear the previous report
Clear-Content $OutputFile

Write-Host "Searching for common WordPress shortcodes..."
"--- Targeted Shortcode Report ---" | Out-File $OutputFile -Append
"Pattern: $ShortcodePattern" | Out-File $OutputFile -Append
"" | Out-File $OutputFile -Append

# Recursively get all Markdown files
$MarkdownFiles = Get-ChildItem -Path $TargetDirectory -Filter "*.md" -Recurse

foreach ($File in $MarkdownFiles) {
    # Read the file content line by line
    $LineNumber = 0
    
    Get-Content $File.FullName | ForEach-Object {
        $LineNumber++
        $_ | Select-String -Pattern $ShortcodePattern -AllMatches | ForEach-Object {
            # Write the result to the report file
            $MatchLine = "$($File.Name) (Line $LineNumber): $($_.Line.Trim())"
            $MatchLine | Out-File $OutputFile -Append
            $Count++
        }
    }
}

Write-Host "---"
Write-Host "Search complete! Found $Count instances. See '$OutputFile' for details."
"--- END OF REPORT ---" | Out-File $OutputFile -Append