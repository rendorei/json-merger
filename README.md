
---

## 📁 File Naming Convention

Make sure your JSON files are named exactly like this:

- `Map_Noclateo.json`
- `Boss_Adel.json`
- `Character_Wylder.json`

> ✅ First letter must be capitalized  
> ✅ File must be in the same directory as the script  
> ❌ Do not include file extensions in parameter values

---

## 🔧 Install `jq` on Windows

1. Download `jq.exe` from the official site:  
   [https://stedolan.github.io/jq/download/](https://stedolan.github.io/jq/download/)

2. Place `jq.exe` in a folder, e.g., `C:\Tools\jq\`

3. Add the folder to your **System PATH**:
   - Open **Start** > search “Environment Variables”
   - Edit **System Environment Variables** → **Environment Variables**
   - Under **System variables**, find `Path`, click **Edit**
   - Add: `C:\Tools\jq\`

4. Confirm installation:
   ```powershell
   jq --version

---

## ▶️ How to Run

1. Open **PowerShell** in the folder containing the script and JSON files.

2. Run the script with the required parameters:

   ```powershell
   powershell -File .\merger.ps1 -map $map -boss $boss -character $character
   ```

3. Output:

   ```
   ✅ Merged JSON written to Merged_Map-<Map>_Boss-<Boss>_Character-<Character>.json
   ```

---

## ⚠️ Common Errors

- `Missing required file: ...`  
  → Check that your filenames and capitalizations are correct

- `'jq' is not recognized as an internal or external command`  
  → `jq.exe` is not installed or not in your `PATH`
