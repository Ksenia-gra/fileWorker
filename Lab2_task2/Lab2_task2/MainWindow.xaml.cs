using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Forms;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using static System.Net.WebRequestMethods;
using Path = System.IO.Path;

namespace Lab2_task2
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        List<FileInfo> files=new List<FileInfo>();
        List<FileInfo> filesSort=new List<FileInfo>();
        public MainWindow()
        {
            InitializeComponent();
            Period.Items.Add("День");
            Period.Items.Add("Неделя");
            Period.Items.Add("Месяц");
            Period.SelectedIndex = 0;

        }

        
        
        public List<FileInfo> DuplicateFiles(List<FileInfo> files)
            //создание списка дубликатов
        {
            List<FileInfo> uniqueFiles = new List<FileInfo>();
            List<FileInfo> duplicateFiles = new List<FileInfo>();

            foreach (FileInfo file in files)
            {
                if (uniqueFiles.Any(f => f.Name == file.Name && f.Length == file.Length))
                {
                    duplicateFiles.Add(file);
                    continue;
                }

                uniqueFiles.Add(file);
            }

            return duplicateFiles;

        }

        public string ChooseDirectory()
            //выбор папки
        {
            string dir = "";
            while (true)
            {
                try
                {
                    FolderBrowserDialog folder = new FolderBrowserDialog();

                    if (folder.ShowDialog() == System.Windows.Forms.DialogResult.OK &&
                        !string.IsNullOrWhiteSpace(folder.SelectedPath))
                    {
                        dir = folder.SelectedPath;
                    }
                    break;
                }
                catch
                {
                    System.Windows.Forms.MessageBox.Show("Нет доступа к папке", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            return dir;
        }

        public List<FileInfo> GetAllFilesFromFolders(string dir)
            //все файлы из папки и подпапок
        {
            List<FileInfo> files1 = new List<FileInfo>();

            try
            {
                files1 = new DirectoryInfo(dir)
                            .GetFiles("*.*", SearchOption.AllDirectories)
                            .OrderBy(x => x.Name)
                            .ToList();

            }
            catch
            {
                System.Windows.Forms.MessageBox.Show("Нет доступа к папке", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }


            return files1;

        }

        public void DeleteDuplicate(List<FileInfo> files)
        {
            //удаление списка дубликатов
            foreach (FileInfo file in files)
            {
                file.Delete();
            }
        }
        
        public List<FileInfo> GetSortedFiles(List<FileInfo> sortedFiles)
            //сортировка файлов по времени
        {

            return sortedFiles.OrderBy(x => x.LastWriteTime).ToList();
        }

        public DateTime CreateFolders(DateTime creationTime,FileInfo file,int period)
            //создание папок с меткой времени в зависимости от выбранного значения(день,неделя,месяц)
        {
            string dirName = creationTime.Date.ToShortDateString();
            DateTime newDate = file.LastWriteTime;
            string projectPath = Environment.CurrentDirectory;
            switch (period)
            {
                case 0:
                    {
                        if(newDate>creationTime)
                        {
                            dirName = newDate.Date.ToShortDateString();
                            creationTime = newDate;
                        }
                            
                        break;
                    }
               
                case 1:
                    {
                        if((newDate-creationTime).Days>7)
                        {
                            dirName = newDate.Date.ToShortDateString() + "-" + newDate.AddDays(7).Date.ToShortDateString(); 
                               
                            creationTime = newDate;
                        }
                           
                        break;
                    }
                case 2:
                    {
                        if((newDate.Month - creationTime.Month)>1)
                        
                        dirName = creationTime.Date.ToShortDateString();
                        creationTime = newDate;
                        break;
                    }
                
            }


            dirName = Path.Combine(projectPath, dirName);
            if (!Directory.Exists(dirName))
            {
                Directory.CreateDirectory(dirName);
            }

            IEnumerable<string> filenames = GetAllFilesFromFolders(dirName).Select(x => x.Name);


            string name = SetNewFileNames(filenames, Path.GetFileNameWithoutExtension(file.Name), file);
            file.CopyTo(Path.Combine(dirName, name + file.Extension));

            return creationTime;

        }

        
        public string SetNewFileNames(IEnumerable<string> filenames,string name,FileInfo file)//задает имена файлов добавляя _(число)
        //обработка возможности добавления копий в одну папку
        {
            int index = 1;
            while (filenames.Contains(name + file.Extension))
            {
                if (index == 1)
                {
                    name += $"_{index++}";
                }
                else
                {
                    int splitIndex = name.LastIndexOf('_');
                    name = name.Substring(0, splitIndex + 1) + $"{index++}";
                }
            }
            return name;
        }

        private void chooseFolder_Click(object sender, RoutedEventArgs e)
        {
            repeatedFiles.Items.Clear();
            string dir = ChooseDirectory();
            FolderWayTextBlock.Text = dir;
            files = GetAllFilesFromFolders(dir);
            if (DuplicateFiles(files).Count == 0) repeatedFiles.Items.Add("Дубликатов не найдено");
            foreach (FileInfo file in DuplicateFiles(files))
            {
                repeatedFiles.Items.Add(file.FullName);
            }
        }

        private void deleteFiles_Click(object sender, RoutedEventArgs e)
        {
            try
            {

                if (files.Count == 0)
                {
                    repeatedFiles.Items.Clear();
                    System.Windows.Forms.MessageBox.Show
                    ("Папка пуста", "Empty Folder", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    repeatedFiles.Items.Add("Дубликатов не найдено");
                }
                else
                {
                    DeleteDuplicate(DuplicateFiles(files));
                    System.Windows.Forms.MessageBox.Show
                    ("Успешно удалено", "Success Delete", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    repeatedFiles.Items.Add("Дубликатов не найдено");
                }

            }
            catch
            {
                System.Windows.Forms.MessageBox.Show
                   ("При удалении произошла ошибка", "Delete Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }


        }


        private void sortFiles_Click(object sender, RoutedEventArgs e)
        {
            if (filesSort.Count == 0)
            {
                System.Windows.Forms.MessageBox.Show
                   ("Папка пуста", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else
            {
                try
                {
                    DateTime creationTime = filesSort[0].LastWriteTime;
                    foreach (FileInfo file in filesSort)
                    {
                        creationTime = CreateFolders(creationTime, file, Period.SelectedIndex);

                    }
                    System.Windows.Forms.MessageBox.Show
                    ("Успешно отсортировано", "Success Sort", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch
                {
                    System.Windows.Forms.MessageBox.Show
                   ("При сортировке произошла ошибка", "Sort Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                
            }

        }



        private void chooseFolderForSort_Click(object sender, RoutedEventArgs e)
        {
            string chosenFolder = ChooseDirectory();
            filesSort = GetSortedFiles(GetAllFilesFromFolders(chosenFolder));
            FolderWayTextBlock2.Text = chosenFolder;
        }

    }
}
