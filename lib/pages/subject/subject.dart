import 'package:flutter/material.dart';
import 'subject_task.dart';
import 'subject_lesson.dart';

//学习
class SubjectPage extends StatefulWidget {
  @override
  _SubjectPageState createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> with SingleTickerProviderStateMixin {
  List tabs = ["待做任务", "我的课程"];

  _SubjectPageState();
  //用于控制/监听Tab菜单切换
  //TabBar和TabBarView正是通过同一个controller来实现菜单切换和滑动状态同步的。
  TabController tabController;

  @override
  void initState() {
    ///初始化，这个函数在生命周期中只调用一次
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void didChangeDependencies() {
    ///在initState之后调 Called when a dependency of this [State] object changes.
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return buildTabScaffold();
  }

  //通过“bottom”属性来添加一个导航栏底部tab按钮组，将要实现的效果如下：
  Widget buildTabScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: Text('学习'),
        //设置选项卡
        bottom: buildTabBar(),
        //设置标题居中
        centerTitle: true,
        // backgroundColor: Colors.white,
      ),
      //设置选项卡对应的page
      body: buildBodyView(),
    );
  }

  // tabbar
  buildTabBar() {
    //构造 TabBar
    Widget tabBar = TabBar(
      //tabs 的长度超出屏幕宽度后，TabBar，是否可滚动
      //设置为false tab 将平分宽度，为true tab 将会自适应宽度
        isScrollable: false,
        //设置tab文字得类型
        labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        //设置tab选中得颜色
        labelColor: Colors.white,
        //设置tab未选中得颜色
        // unselectedLabelColor: Color(0xffa4a4a4),
        //设置自定义tab的指示器，CustomUnderlineTabIndicator
        //若不需要自定义，可直接通过
        indicatorColor: Color(0xffffcc2d),
        //indicatorWight 设置指示器厚度
        //indicatorPadding
        //indicatorSize  设置指示器大小计算方式
        ///指示器大小计算方式，TabBarIndicatorSize.label跟文字等宽,TabBarIndicatorSize.tab跟每个tab等宽
        indicatorSize: TabBarIndicatorSize.label,
        //生成Tab菜单
        controller: tabController,
        //构造Tab集合
        tabs: tabs.map((e) => Tab(text: e)).toList());

    return tabBar;
  }

  // tab页内容
  buildBodyView() {
    //构造 TabBarView
    Widget tabBarBodyView = TabBarView(
      controller: tabController,
      //创建Tab页
      children: tabs.map((e) {
        return Container(
          alignment: Alignment.center,
          color: Colors.white,
          child: e == '待做任务' ? TodayTaskPage() : MyLessonPage(),
        );
      }).toList(),
    );
    return tabBarBodyView;
  }

  //当整个页面dispose时，记得把控制器也dispose掉，释放内存
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}