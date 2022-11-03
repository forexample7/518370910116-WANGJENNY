# Course Work
## Interactive Design Tool

### Introduction

This work focuses on the redesign of fonts and interaction experience. Every one can create a unique font.
The program realizes the design of every letter with 3 different types of dynamic font. 
User can save pictures of satisfied creatoin for personalized use. 
本作业主要围绕字体的重新设计和交互体验，每个使用的人都可以创建独一无二的字体。  
这个程序实现了对所有字母的设计，以及三种不同风格的动态字体的功能。用户能够保存满意的字体作品图片和视频，并用于自己的个性化用途。  

remark：
1. tool2实现了tool之外的字符串设计功能（可输入完整的单词，通过enter来刷新页面）  
2. 具体两个设计工具的说明书见各自文件夹内的“设计工具说明书”  
3. 操作使用demo视频由于时间关系只完成了tool的版本  

### Flow of the idea

  	Create a blank canvas PGraphics
  	Input String
  	Transfer canvas PGraphics into an image PImage
  	Read all the positions taken by the string PVector[]
  	Process the positions and pixels

### Main Functions

程序初始界面：  
You can change the letter any time

任何操作过程中都可以通过键盘改变字母  
![image](https://github.com/forexample7/518370910116-WANGJENNY/blob/main/%5B%E7%AC%AC%E4%B9%9D%E6%AC%A1%E4%BD%9C%E4%B8%9A%EF%BC%9A%E5%A4%A7%E4%BD%9C%E4%B8%9A%5D/tool/display0.png)  
Click mouse ``mouseClick`` to enter font design interface：  
![image](https://github.com/forexample7/518370910116-WANGJENNY/blob/main/%5B%E7%AC%AC%E4%B9%9D%E6%AC%A1%E4%BD%9C%E4%B8%9A%EF%BC%9A%E5%A4%A7%E4%BD%9C%E4%B8%9A%5D/tool/display1.png)  
Press ``TAB`` to change font type：  
<table>
	<tr>
		<td>
			<img src=https://github.com/forexample7/518370910116-WANGJENNY/blob/main/%5B%E7%AC%AC%E4%B9%9D%E6%AC%A1%E4%BD%9C%E4%B8%9A%EF%BC%9A%E5%A4%A7%E4%BD%9C%E4%B8%9A%5D/tool/display2.png border=0>
		</td>
		<td>
			<img src=https://github.com/forexample7/518370910116-WANGJENNY/blob/main/%5B%E7%AC%AC%E4%B9%9D%E6%AC%A1%E4%BD%9C%E4%B8%9A%EF%BC%9A%E5%A4%A7%E4%BD%9C%E4%B8%9A%5D/tool/display3.png border=0>
		</td>
	</tr>
	<tr>
	<td>
			<img src=https://github.com/forexample7/518370910116-WANGJENNY/blob/main/%5B%E7%AC%AC%E4%B9%9D%E6%AC%A1%E4%BD%9C%E4%B8%9A%EF%BC%9A%E5%A4%A7%E4%BD%9C%E4%B8%9A%5D/tool/display4.png border=0>
		</td>
		<td>
			<img src=https://github.com/forexample7/518370910116-WANGJENNY/blob/main/%5B%E7%AC%AC%E4%B9%9D%E6%AC%A1%E4%BD%9C%E4%B8%9A%EF%BC%9A%E5%A4%A7%E4%BD%9C%E4%B8%9A%5D/tool/display5.png border=0>
		</td>
	</tr>
</table>  
remark: The dynamic effect of these two fonts can change according to the position of the mouse
这两种字体动态效果能够根据鼠标的位置进行交互变化

Click mous again ``mouseClick`` and return to initial interface  

### Aid Functions
``SPACE`` save the picture  
``[``start recording video  
``]``finish recording video 
