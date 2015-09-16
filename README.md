# HXYLightTableView

HXYLightTableView是使用BaseTableViewProtocol的Demo。BaseTableViewProtocol封装了UITableView协议，把UITableView的datasource和delegate从Controller中抽离出来，化了TableVi简ew的实现，并且将tableView无内容的样式和Cell分割线的样式封装其中。


**当然，本人目前能力和精力有限，代码还存在优化的空间，我会尽力慢慢优化的。**

##特性：
1. 基于iOS8.0以上
2. 基本的datasource和delegate
2. 支持TableView无内容时显示文字或图片占位符
3. 支持改变Cell分割线的样式（顶头或不顶头）
4. 支持多个section和单个section
5. 利用iOS8的Self Sizing Cells 实现Cell的高度自适应
