# 网络分析

## 图的绘制
1. 图的类型和特点

    |Networkx Class|Type|Self-loops allowed|Parallel edges allowed|
    |--------|--------|------|-----|
    |Graph|undirected|Yes|No|
    |DiGraph|directed|Yes|No|
    |MultiGraph|undirected|Yes|Yes|
    |MultiDiGraph|directed|Yes|Yes|

2. 创建图
    1. 创建各类图
       1. 创建无向图：`G = nx.Graph()`
       2. 创建有向图：`G = nx.DiGraph()`，有向图的矩阵中i，j位置表示方向从i到j。
       3. 创建多维无向图：`G = nx.MultiGraph()`，节点间有多条不定向边
       4. 创建多维有向图：`nx.MultiDiGraph()`
    2. 图的属性
       1. 属性创建：`G = nx.Graph(day="Friday")`
       2. 属性修改：`G.graph['day'] = "Monday"`，也可以用于创建
3. 图的绘制：
   1. 简单绘图：`draw(G, pos=None, ax=None, **kwds)`
   2. 画有箭头的图：`draw_networkx(G, pos=None, arrows=None, with_labels=True, **kwds)`
   3. 对图中的节点进行调整：`draw_networkx_nodes`
   4. 对图中的边进行调整：`draw_networkx_edges`
   5. 对图中节点的标签进行添加：`draw_networkx_labels`
   6. 对图中边的标签进行添加：`draw_networkx_edge_labels`

## 节点
1. 节点的简单导入
   1. 导入：
      1. 导入单个节点：`G.add_node(1)`，特例：可以将其它图的多个节点当成一个节点导入
      2. 导入多个节点：`G.add_nodes_from([2, 3])`，其节点来自的内容可以是列表，也可以是其它迭代容器（字符串，其它图形等）
   2. 属性：
      1. 导入节点时属性添加：（也可以用于后续的修改）
         1. 单个：`G.add_node(1, time='5pm')`
         2. 多个：`G.add_nodes_from([(4, {"color": "red"}),(5, {"color": "green"}),])`或`G.add_nodes_from([3], time='2pm')`，后者所有节点属性相同
2. 节点的删除
   1. 删除单个节点：`G.remove_node(2)`
   2. 删除多个节点：`G.remove_nodes_from("spam")`
3. 访问：
   1. 访问节点的属性
      1. 访问某个节点的特定属性：`G.nodes[1]['room'] = 714`，也可以用来添加节点的属性
      2. 访问所有节点的所有属性：`G.nodes.data()`
   2. 访问某节点邻居节点的属性
      1. `G[1]`,返回一个邻居节点字典，键是邻居节点，值是边的属性字典。例如：`{2: {'color': 'yellow'}}`
      2. `G.adj[1]`
4. 节点统计：
   1. 统计数量：`G.number_of_nodes()`
   2. 统计度：`G.degree[1]`
   
## 边
1. 边的简单导入
   1. 导入：
      1. 导入单个边：`G.add_edge(1, 2)`，或`e = (2, 3) G.add_edge(*e) # 解开包边元组`
      2. 导入多个边：`G.add_edges_from([(1, 2), (1, 3)])`
   2. 属性：
      1. 导入节点时添加：（也可以用于后续的修改）
         1. 单个：`G.add_edge(1, 2, weight=4.7 )`
         2. 多个：`G.add_edges_from([(1, 2, {'color': 'blue'}), (2, 3, {'weight': 8})])`或`G.add_edges_from([(3, 4), (4, 5)], color='red')`
2. 边的删除
   1. 删除单个边：`G.remove_edge(1, 3)`
   2. 删除多个节点：`G.remove_edges_from([(1, 2), (2, 3)])`
3. 访问属性：
   1. 访问某两个节点连边的属性：`G[1][2]['weight'] = 4.7`或`G.edges[3, 4]['weight'] = 4.2`
4. 边统计：
   1. 统计数量：`G.number_of_edges()`
   2. 统计与包含某节点的边：`G.edges([2, 'm']) # 分别统计了包含2的边和包含m的边`
   
## 列表或矩阵导入
1. 矩阵导入：
   1. pandas邻接矩阵：`from_pandas_adjacency(df, create_using=None)`，矩阵的索引和表头要一一对应
      1. 添加属性：
         1. 当以索引为节点名时：`G.add_nodes_from((n, dict(d)) for n, d in df_nodes.iterrows())`
         2. 当以'ID'为节点名时：`G.add_nodes_from((row["node_id"], {"attribute1": row["attribute1"]}) for _, row in df_nodes.iterrows())`