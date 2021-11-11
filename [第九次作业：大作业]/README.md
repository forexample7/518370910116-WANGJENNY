# 课程大作业
## 交互设计工具

### 作业简介
本作业主要围绕字体的重新设计和交互体验，每个使用的人都可以创建独一无二的字体。  
这个程序实现了对所有字母的设计，以及三种不同风格的动态字体的功能。用户能够保存满意的字体作品图片和视频，并用于自己的个性化用途。

### 程序思路

  	创建空白画布PGraphics
  	输入字符串String
  	将画布PGraphics转化为像素图PImage
  	读取字符所占所有位置向量PVector[]
  	对像素进行处理

### 主要功能
程序初始界面：  
![image](https://github.com/forexample7/518370910116-WANGJENNY/blob/main/%5B%E7%AC%AC%E4%B9%9D%E6%AC%A1%E4%BD%9C%E4%B8%9A%EF%BC%9A%E5%A4%A7%E4%BD%9C%E4%B8%9A%5D/tool/display0.png)
点击鼠标``mouseClick``进入字体设计界面：  
![image](https://github.com/forexample7/518370910116-WANGJENNY/blob/main/%5B%E7%AC%AC%E4%B9%9D%E6%AC%A1%E4%BD%9C%E4%B8%9A%EF%BC%9A%E5%A4%A7%E4%BD%9C%E4%B8%9A%5D/tool/display1.png)
按键盘``TAB``可以切换字体设计：  
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
remark: 这两种字体动态效果能够根据鼠标的位置进行交互变化  
再次点击鼠标``mouseClick``回到程序初始界面  

### 辅助功能
``空格`` 保存图片  
``[``开始录制视频  
``]``结束录制视频  
