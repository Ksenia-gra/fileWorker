using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Xml.Linq;

namespace DigitalDesign
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private const int stepSize= 2;
        private const int maxValue = 12;
        private const int minValue = 0;
        public MainWindow()
        {
            InitializeComponent();


        }

        public bool checkValue(int value)//проверка значения размера поля
        {   
            return (value > maxValue || value == minValue);
        }

        
        
        private ToggleButton CreateGameToggle() //создание игровой toggleButton
        {
           
            ToggleButton tb = new ToggleButton()
            {
                Style = Application.Current.FindResource("ContentFlipper") as Style,
                Content = new Line()
                {
                    Style = Application.Current.FindResource("RotationalLine") as Style
                }
                
            };
            
            

            Line line = (Line)tb.Content;
            line.RenderTransform = new RotateTransform(0, Math.Abs(line.X2 - line.X1) / 2, Math.Abs(line.Y2 - line.Y1) / 2);
           
            
            return tb;
        }
        private void CreateGameField() //составление игрового поля
        {
            Field.Children.Clear();
            int[] choose = new[] { 0, 1 };
            int fullFieldSize = (int)Math.Pow(int.Parse(fieldSizeText.Text), 2);
            Random random = new Random();
            for(int i=0;i<fullFieldSize;i++)
            {
                ToggleButton tb = CreateGameToggle();
                if (choose[random.Next(0, choose.Length)] == 0)
                {
                    tb.IsChecked = false;
                }
                else
                {
                    tb.IsChecked = true;
                }
                Field.Children.Add(tb);
            }
            CreateEvent(Field.Children);

        }
        private int FindIndex(ToggleButton tb)//поиск индекса выбранного toggleButton
        {
            for (int i = 0; i < Field.Children.Count; i++)
            {
                if (Field.Children[i] == tb)
                {
                    return i; 
                }
            }
            return -1;
        }
        private void DeleteEvent(UIElementCollection tbs)//удаление обработчика событий выбора для togglebutton
        {
            foreach(ToggleButton tb in tbs)
            {
                tb.Checked -= ToggleButton_Checked;
                tb.Unchecked -= ToggleButton_Unchecked;

            }

        }
        private void CreateEvent(UIElementCollection tbs)//установка обработчика событий выбора для togglebutton
        {
            foreach (ToggleButton tb in tbs)
            {
                tb.Checked += ToggleButton_Checked;
                tb.Unchecked += ToggleButton_Unchecked;
            }

        }

       

        private bool CheckWinnings(List<ToggleButton> tbs)//проверка повернуты ли рычаги в одну сторону
        {
            return tbs.All(s => s.IsChecked == true) || tbs.All(s => s.IsChecked == false);
        }
        private void ResetField()//обновление поля
        {
            List<ToggleButton> tbs = new List<ToggleButton>();

            foreach(ToggleButton tb in Field.Children)
            {
                tbs.Add(tb);
            }

            if(CheckWinnings(tbs))
            {
                MessageBox.Show("Поздравляю,вы выиграли", "Congratlation", MessageBoxButton.OK, MessageBoxImage.Information);
                CreateGameField();
            }
        }
        private void minus_Click(object sender, RoutedEventArgs e)
        {
            int fieldSize = int.Parse(fieldSizeText.Text);
            int fieldSizeMinus = fieldSize - stepSize;
            if (!checkValue(fieldSizeMinus))
                fieldSizeText.Text = (fieldSizeMinus).ToString();

        }
        private void plus_Click(object sender, RoutedEventArgs e)
        {
            int fieldSize = int.Parse(fieldSizeText.Text);
            int fieldSizePlus = fieldSize + stepSize;
            if (!checkValue(fieldSizePlus))
                fieldSizeText.Text = (fieldSizePlus).ToString();

        }
        private void ToggleButton_Checked(object sender, RoutedEventArgs e)
        {
            
            int index = FindIndex((sender as ToggleButton));
            DeleteEvent(Field.Children);
            int fieldSize = int.Parse(fieldSizeText.Text);
            int selectRow = index/ fieldSize;
            int selectColumn = index%fieldSize;
            for(int i=0;i<fieldSize;i++)
            {
                if ((Field.Children[fieldSize * i + selectColumn] as ToggleButton).IsChecked == true)
                    (Field.Children[fieldSize * i + selectColumn] as ToggleButton).IsChecked = false;
                else
                    (Field.Children[fieldSize * i + selectColumn] as ToggleButton).IsChecked = true;
            }

            for (int j = 0; j < fieldSize; j++)
            {
                if ((Field.Children[fieldSize * selectRow + j] as ToggleButton).IsChecked == true)
                    (Field.Children[fieldSize * selectRow + j] as ToggleButton).IsChecked = false;
                else
                    (Field.Children[fieldSize * selectRow + j] as ToggleButton).IsChecked = true;
            }
            CreateEvent(Field.Children);
            ResetField();
        }
        private void fieldSizeText_TextChanged(object sender, TextChangedEventArgs e)
        {
            CreateGameField();
        }
        private void ToggleButton_Unchecked(object sender, RoutedEventArgs e)
        {
            
            int index = FindIndex((sender as ToggleButton));
            DeleteEvent(Field.Children);
            int fieldSize = int.Parse(fieldSizeText.Text);
            int selectRow = index / fieldSize;
            int selectColumn = index % fieldSize;
            for (int i = 0; i < fieldSize; i++)
            {
                if ((Field.Children[fieldSize * i + selectColumn] as ToggleButton).IsChecked == true)
                    (Field.Children[fieldSize * i + selectColumn] as ToggleButton).IsChecked = false;
                else
                    (Field.Children[fieldSize * i + selectColumn] as ToggleButton).IsChecked = true;
            }

            for (int j = 0; j < fieldSize; j++)
            {
                if ((Field.Children[fieldSize * selectRow + j] as ToggleButton).IsChecked == true)
                    (Field.Children[fieldSize * selectRow + j] as ToggleButton).IsChecked = false;
                else
                    (Field.Children[fieldSize * selectRow + j] as ToggleButton).IsChecked = true;
            }
            CreateEvent(Field.Children);
            ResetField();
        }
    }
}
