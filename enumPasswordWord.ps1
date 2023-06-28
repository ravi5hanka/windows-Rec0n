# Sensitive data locations (example: searching for files containing 'password' in their names)
Get-ChildItem -Path C:\ -Recurse -File -Filter '*password*' -ErrorAction SilentlyContinue | Select-Object Directory, Name
