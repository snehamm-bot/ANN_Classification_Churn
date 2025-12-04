# ANN_Classification_Churn

## Repository Visibility Check

This repository includes functionality to check its visibility status using the GitHub CLI.

### Using GitHub CLI Directly

You can check the repository visibility using the GitHub CLI command:

```bash
gh repo view OWNER/REPO --json visibility
```

**Example:**
```bash
gh repo view snehamm-bot/ANN_Classification_Churn --json visibility
```

This command will output the visibility status in JSON format:
- `"PUBLIC"` for public repositories
- `"PRIVATE"` for private repositories

### Using the Check Visibility Script

A convenience script is provided to check repository visibility:

```bash
# Make the script executable (first time only)
chmod +x check_visibility.sh

# Run the script
./check_visibility.sh [OWNER/REPO]
```

**Examples:**
```bash
# Check a specific repository
./check_visibility.sh snehamm-bot/ANN_Classification_Churn

# Check the current repository (when run from within the repo)
./check_visibility.sh

# Alternative: Run with bash (doesn't require execute permission)
bash check_visibility.sh snehamm-bot/ANN_Classification_Churn
```

**Note:** You need to have the GitHub CLI (`gh`) installed and authenticated. Visit https://cli.github.com/ for installation instructions.

### GitHub Actions Workflow

The repository includes a GitHub Actions workflow (`.github/workflows/check-visibility.yml`) that automatically checks the repository visibility on push events to the main branch or can be triggered manually.
