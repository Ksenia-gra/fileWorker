   M S B A M L   `   `   `  ????H  DDigitalDesign, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null-clr-namespace:DigitalDesignDigitalDesign  5   	       DigitalDesign.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   -localclr-namespace:DigitalDesign     5   	     ? Title$  
MainWindow??5   	   $	??750??6   $	??750??6)   .??5
      ?  ? ShowGridLines .  ? RowDefinitions 5   
   ?? 5      $??4* ?6   ?? 5      $??* ?6   .+?5   
   A? -   5        $??Field??5       ? DataContext 6#   ??  A? Rows 5      ??  ?? ElementName$ fieldSizeText?? ?? Path$
 Text? A? Columns 5      ?? $ fieldSizeText??$
 Text?5      A? 5   
   $ 2??6   $??1??6    $	??Top=?6-   .+?5      ?? $??22(?6   $??Center=?5      $??Center=?5       $
??Wrap=?5!      (&Выберите размер поля5$      ? 5%       ? ColumnDefinitions 5&      ?? 5'      $??* ?6'   ?? 5(      $??* ?6'   ?? 5)      $??* ?6'   .+?5+      ?? -   5        	 ??Name$	 minus??5+      $??-??5,      $??22(?5-      $
??Bold"?5.      $
??15,5q?5/      
???????
??? ???$??5q?54      56      ?? 57      -   5        $??fieldSizeText??59      
 ?? 
IsReadOnly
 . $??1??58      $??Center=?5:      
?????? $??22(?5<      $??2??5=       ?? TextAlignment$ Center=?5>      .??5?   B   5A      ?? 5B      -   5        $
	 plus??5B      $??+??5C      $??22(?5D      $
??Bold"?5E      $
??15,5q?5F      $??2??5G      
???????
??? ???$??5q?5K      5M      5N      5O      5P      5R      