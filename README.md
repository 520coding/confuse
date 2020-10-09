# confuse(iOS马甲包，上架神器)

<a name="X50Qx"></a>
#                             ![image.png](https://cdn.nlark.com/yuque/0/2020/png/213807/1593768128247-016fe60b-8853-48fb-8b76-f9f702b83db5.png#align=left&display=inline&height=177&margin=%5Bobject%20Object%5D&name=image.png&originHeight=512&originWidth=512&size=119707&status=done&style=none&width=177)
<a name="KQtMH"></a>
# 前言
因公司发展需要，本人19年中旬开始从事iOS马甲包业务，前期也使用过目前市面上其他得马甲包工具，均失败了。经过大量实践，开发出一款功能齐全的马甲包工具（支持OC、Lua、C++）。工具的主要功能OC已封装成Mac应用，其他功能还在封装中，敬请期待。（目前公测阶段: _**免费**_）
<a name="iji4j"></a>
# 实践
本人在实践中提审的结果汇总如下（涉及保密，不便透露细节）：

- 非游戏类过包率：**30~50%**
   - 优惠券类型18套，过包率42%
   - 壁纸类型15套，过包率33%
- 游戏类过包率：**20~30%**
   - 塔防类型约40套，过包率22%，该款游戏其他渠道方也在提审，历史提包总数预计500~1000套
   - 卡牌类型1套，过包率100%
<a name="qPY4i"></a>
# 提示
为了提高通用性，近期不断重构(>=v1.2.0)之前老版本的功能，为此新建测试工程confuse_test，大家在实际使用过程中如果遇到问题，欢迎扩展测试工程（在工程中请注明bug细节）
<a name="8cWfW"></a>
# 功能
confuse是一款马甲包工具，侧重于**游戏马甲包**，尽最大可能模拟人工手动混淆，避免机器审核4.3、2.1、2.3.1、账号调查等，功能如下：
<a name="MQHkR"></a>
### 已完成

1. 混淆前资源替换，指定需要替换的资源文件夹，自动进行同名文件替换，方便快捷
1. 删注释
1. 魔改颜色，对项目中UI颜色随机偏移，可自定义宏
1. 微调字体，对项目中使用的字体随机微调
1. 修改全局变量，替换全局变量名、混淆字符串变量值
1. 修改图片，图片质量修改、大小偏移、颜色微调、透明度设置、RGB偏移、模式修改等
1. 重命名方法名，支持**多参修改**，近似Xcode的Rename功能，方法名混淆和类名及类型关联，同名方法不同类、同类同名方法不同类型（类方法、对象方法）混淆后将不一致
1. 重命名属性名，支持@property的所有类型，可设置属性名后缀过滤
1. **修改方法**：对原方法进行**拆分调用并根据参数类型（支持继承）局部调整**，[详情见参数类型汇总表](https://www.yuque.com/docs/share/315b72d9-28f9-4fa6-bf20-c40d94f2253a?#《修改方法-支持参数类型汇总表》)
1. 重命名图片名
1. UI布局偏移，支持SDAutoLayout、Masonry、Frame
1. 垃圾垃圾，支持自动插入项目中，无需手动导入
   1. 插入ViewController文件
   1. 插入文本文件（json、txt、doc）
   1. 插入垃圾属性
   1. 插入垃圾方法
      1. 插入自定义垃圾文件
      1. 插入分类附带随机方法
13. 多语言混淆、支持汉字
13. 修改字符串，加密处理
13. xib、storyboard文件插入垃圾视图，并修改内部结构属性
13. 重命名文件名、类名，**支持近似替换**，可指定添加前缀
13. 修改项目基本配置，版本号、SDK的BundleID、版本号



以上所有功能均支持黑名单过滤，对指定的内容进行屏蔽，忽略混淆。各个模块的随机单词个数可自定义调整
<a name="OEesy"></a>
### 规划中
更新迭代将按照以下顺序依次进行

1. Objective-C，重构的目的是为了提高工具的通用性和稳定性
   1. 重构《修改颜色》
   1. 重构《UI布局偏移》
   1. 重构《多语言》
2. C++，现有功能还不具备通用性，暂时不开放，准备重构中...
   1. 字符串加密混淆
   1. 方法
      1. 重命名
      1. 插入
      1. 修改
   3. 属性
      1. 重命名
      1. 修改
      1. 插入
3. Cocos2d-x，现有功能不具备通用性，准备整合至C++中
3. Lua的针对性太强了，暂时不开放，暂时不打算重构有需要在说吧
3. Swift，本人实际项目使用不多，故排在最后，看用户需求再决定
<a name="vlfzY"></a>
# 图文介绍
运行APP效果图，使用前请详细阅读[工具使用教程](https://www.yuque.com/docs/share/edd2603f-d09d-4795-ae71-b42419b99446?#《confuse使用说明》)<br />![image.png](https://cdn.nlark.com/yuque/0/2020/png/213807/1594644980313-b3ee8604-9652-4bba-bb18-3d06399593e9.png#align=left&display=inline&height=540&margin=%5Bobject%20Object%5D&name=image.png&originHeight=1080&originWidth=1920&size=537018&status=done&style=none&width=960)
<a name="WtuYs"></a>
# 更新日志
<a name="Suc2D"></a>
### v1.8.1（2020.10.09）

1. 新增导出、导入配置、出厂设置，target名称校验
1. 修复多参方法名如果同时存在NSArray、NSDictionary及子类，混淆后将会同时插入两个同名局部变量bug
1. 优化《修改方法》<br />a. 支持继承类型判断<br />b. 新增7种参数类型识别
1. 新增计划说明
1. 适配Xcode12

[查看更多历史更新记录](https://www.yuque.com/docs/share/39f2f60e-b6a8-443b-b005-b9364fb79b95?#《confuse更新说明》)
<a name="63ca6131"></a>
# 感谢反馈
[shizu2014](https://github.com/shizu2014)、[myhonior](https://github.com/myhonior)
<a name="BUG"></a>
# 链接导航

1. [马甲包简介](https://www.yuque.com/docs/share/7e70244c-5dea-4035-b634-65cc082097da?#《马甲包简介》)
