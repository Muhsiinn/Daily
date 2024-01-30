import os 
import shutil

def org_files(down_folder,dest_folder):
    if not os.path.exists(dest_folder):
        os.makedirs(dest_folder)
    for item in os.listdir(down_folder):
        item_path = os.path.join(down_folder,item)
        if os.path.isfile(item_path):
            file_extension = os.path.splitext(item)[1]
            target_folder = os.path.join(dest_folder,file_extension[1:])

            if not os.path.exists(target_folder):
                os.makedirs(target_folder)

            target_path = os.path.join(target_folder,item)
            shutil.move(item_path,target_path)
            print(f"Moved {item} to {target_folder}")

def main():
    d_folder= r"D:\downloads"
    des_folder = r"D:\Downloads"
    org_files(d_folder,des_folder)
main()
