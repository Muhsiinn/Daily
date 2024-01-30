## README.md

### Organize Files Script

This Python script is designed to organize files in a given directory by categorizing them based on their file extensions. It moves files to folders with names corresponding to their file extensions.

#### Usage

1. **Requirements:**
   - Python 3.x installed.

2. **Installation:**
   - Open a terminal or command prompt and run the following commands to install required modules:
     ```bash
     pip install os
     pip install shutil
     ```

3. **Instructions:**
   - Clone or download the script to your local machine.
   - Open the script in a text editor to view or modify.

4. **Execution:**
   - Run the script by executing the `main()` function.
   - By default, it organizes files in the `D:\downloads` directory and moves them to the `D:\Downloads` directory.

5. **Customization:**
   - You can customize the source and destination folders by modifying the `d_folder` and `des_folder` variables in the `main()` function.

6. **Example:**
   - Running the script will organize files from the source folder (`D:\downloads`) into folders based on their file extensions in the destination folder (`D:\Downloads`).

### PyInstaller Tutorial

#### Step 1: Install PyInstaller

Open a terminal or command prompt and run the following command to install PyInstaller:

```bash
pip install pyinstaller

Step 2: Convert the Python Script to an Executable

~pyinstaller --onefile your_script.py


Find the executable in the dist directory.

Step 3: Add to Windows Startup Folder

Press Win + R to open Run.
Type shell:startup and press Enter.
Copy the executable from dist and paste it into the Startup folder.
The script will run on every login.
For more options, refer to PyInstaller documentation.

