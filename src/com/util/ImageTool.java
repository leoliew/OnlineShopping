package com.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.Random;

public class ImageTool {
		
	
	
	public ImageTool() {
		super();
		System.out.println("ImageTool默认构造方法");
	}

		//验证码的值
		public String randsString = "";
	//验证码的范围
		private String[] chars = { "1", "2", "3", "4", "5", "6", "7", "8", "9",
				"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "L","M","N","Q","R","S","T" };

	      /**
		 * 
		 * @Title: getRandColor 给定范围获得随机颜色 ,定义背景颜色
		 * @param fc 给定的小于255的数字
		 * @param bc 给定的小于255的数字
		 * @return
		 * @Exception 异常对象
		 * @since CodingExample　Ver(编码范例查看) 1.1
		 */
		public Color getRandColor(int fc, int bc) {
			Random random = new Random();
			if (fc > 255) {
				fc = 255;
			}
			if (bc > 255) {
				bc = 255;
			}
			// 颜色：r红 red,g绿 green,b蓝 blue
			int r = fc + random.nextInt(bc - fc);
			int g = fc + random.nextInt(bc - fc);
			int b = fc + random.nextInt(bc - fc);

			return new Color(r, g, b);
		}

		/**
		 * 
		 * @Title: createImage 创建图像
		 * @Exception 异常对象
		 * @since CodingExample　Ver(编码范例查看) 1.1
		 */
		public BufferedImage createImage() {
			// 图像的宽度和高度
			int width = 90, height = 20;

			// 创建一个以RGB类型的具有可访问图像数据缓冲区的图像
			// BufferedImage.TYPE_INT_RGB表示一个图像，该图像具有打包成整数像素的 8 位 RGB 颜色分量
			BufferedImage image = new BufferedImage(width, height,
					BufferedImage.TYPE_INT_RGB);

			// 获取图形的上下文
			Graphics graphics = image.getGraphics();

			// 生成随机类
			Random random = new Random();

			// 设定背景色,颜色的参数可以自定，但不要大于255,要先设下颜色，不然看不清验证码
			graphics.setColor(this.getRandColor(200, 250));

			// 填充指定的矩形,图像的形状
			graphics.fillRect(0, 0, width, height);

			// 设定字体,new Font根据指定名称、样式和磅值大小
			graphics.setFont(new Font("微软雅黑", Font.PLAIN, 20));

			// 随机产生155条干扰线，使图象中的认证码不易被其它程序探测到
			for (int i = 0; i < 100; i++) {
				graphics.setColor(this.getRandColor(160, 200));

				int x1 = random.nextInt(width);
				int y1 = random.nextInt(height);
				int x2 = random.nextInt(12);
				int y2 = random.nextInt(12);
				// 在此图形上下文的坐标系中，使用当前颜色在点 (x1, y1) 和 (x2, y2) 之间画一条线
				graphics.drawLine(x1, y1, x1 + x2, y1 + y2);
			}

			// 取随机产生的认证码(6位数字)
			for (int i = 0; i < 1; i++) {
				 int indx=random.nextInt(chars.length);
				String rand = String.valueOf(chars[indx]);
				randsString += rand;
				// 将认证码显示到图像中,调用前面的方法生成的颜色相同，所以只能重新生成
				graphics.setColor(new Color(20 + random.nextInt(110), 20 + random
						.nextInt(110), 20 + random.nextInt(110)));
				//使用此图形上下文的当前字体和颜色绘制由指定 string 给定的文本
				//13 * i + 6表示数字间距
				graphics.drawString(rand, 13 * i + 6, 16);
			}

			// 释放此图形的上下文以及它使用的所有系统资源
			graphics.dispose();
			return image;
		}

}
