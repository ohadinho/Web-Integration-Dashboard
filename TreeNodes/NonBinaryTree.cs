using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TreeNodes
{
    public class NonBinaryTree<T> where T : GUIDTree
    {
        #region Props

        public Node<T> Root { get; private set;}
        public List<T> ListGUIDTree { get; private set; }
        private List<int> numNodesInLevel;
        public int MaxNodesInLevel { get; private set; }
        public int TotalWidth { get; private set; }
        public int TotalHeight { get; private set; }

        #endregion

        #region Ctor

        public NonBinaryTree(List<T> listGUIDTree)
        {
            this.ListGUIDTree = listGUIDTree;
            this.Root = new Node<T>(null, this.ListGUIDTree[0]);
            this.numNodesInLevel = new List<int>();
        }

        #endregion

        /// <summary>
        /// Creates the tree
        /// </summary>
        /// <returns>Root node</returns>
        public Node<T> CreateTree()
        {
            // Load Tree - Creating nodes with parents & children values. Without siblings, belongTo, shapeSegment
            Load(this.ListGUIDTree, this.Root);

            // Num nodes in level
            SetNodesInLevel(this.Root, 0);
            this.MaxNodesInLevel = this.numNodesInLevel.Max();

            // Set siblings
            SetSiblings(this.Root);

            this.TotalWidth = this.MaxNodesInLevel * Node<T>.ShapeSegmentWidth;
            this.TotalHeight = this.numNodesInLevel.Count * Node<T>.ShapeSegmentHeight;

            // Setting each node (shape) segment + shape middle point (middle of the segment)
            // First root segment starts with 0,0
            Point topLeft = new Point(0, 0);
            // First root segment end
            Point bottomRight = new Point(this.TotalWidth, Node<T>.ShapeSegmentHeight);

            // Setting shape segments on each node
            SetSegments(this.Root, topLeft, bottomRight);

            return this.Root;
        }

        public void SetSegments(Node<T> currentNode, Point topLeft, Point bottomRight)
        {
            Segment seg = new Segment();
            seg.TopLeft = topLeft;
            seg.BottomRight = bottomRight;
            currentNode.BelongTo = seg;
            // Middle point of the shape
            currentNode.ShapeMiddle = new Point((topLeft.X + bottomRight.X) / 2,(topLeft.Y + bottomRight.Y)/2);            

            // If no more children left, we can break the method
            if (currentNode.Children.Count == 0)
                return;

            #region Children of this node - setting their segments

            // Each child (=shape) segment WIDTH is the current left X - current right X, divided by the children count (because you need a segment for EACH child)
            int childSegmentGap = (bottomRight.X - topLeft.X) / currentNode.Children.Count;
            Point currentTopLeft = new Point(topLeft.X,bottomRight.Y);
            Point currentBottomRight = new Point(topLeft.X + childSegmentGap, bottomRight.Y + Node<T>.ShapeSegmentHeight);

            foreach (Node<T> node in currentNode.Children)
            {
                // Recursion in order to set a new segment for the child process
                SetSegments(node, currentTopLeft, currentBottomRight);

                // Changing the topleft X coordinate of the next child (moving from left to right)
                currentTopLeft = new Point(currentTopLeft.X + childSegmentGap, currentTopLeft.Y);                
                
                // Changing the bottomRight X coordinate of the next child (moving from left to right)
                currentBottomRight = new Point(currentTopLeft.X + childSegmentGap, currentBottomRight.Y);
            }

            #endregion
        }

        // Break Rule = no children
        public void SetSiblings(Node<T> currentNode)
        {
            if (currentNode.Parent != null)
            {
                // Find all parent children, not including the current child
                List<Node<T>> currenNodeSiblings = currentNode.Parent.Children.Where(a => currentNode.Data.ServiceInstanceId != a.Data.ServiceInstanceId).ToList();

                // For each child found, add it to the current siblings
                foreach (Node<T> node in currenNodeSiblings)
                    currentNode.Siblings.Add(node);
            }

            foreach (Node<T> child in currentNode.Children)
                SetSiblings(child);
        }

        public void Load(List<T> list, Node<T> currentNode)
        {
            // if it's a leaf
            if (currentNode.Data.NextServiceName == null)
                return;

            // if it's the root
            if (currentNode.Data.PrevServiceInstanceId == null)
                currentNode.Parent = null;

            List<T> listChildren = list.Where(a => a.PrevServiceInstanceId == currentNode.Data.ServiceInstanceId).ToList<T>();
            foreach (T childData in listChildren)
            {
                Node<T> child = new Node<T>(currentNode, childData);
                currentNode.Children.Add(child);
                Load(list, child);
            }
        }

        public void SetNodesInLevel(Node<T> node, int levelIndex)
        {
            // Adding to a list a level
            if (this.numNodesInLevel.Count == levelIndex)
                this.numNodesInLevel.Add(0);

            // Increasing nodes count for current level index
            this.numNodesInLevel[levelIndex]++;
            // Save level index in the node
            node.Level = levelIndex;

            // Checking if there is no children to current node - then we should end
            if (node.Children.Count() == 0)
            {                
                return;
            }                        

            // Recursion on each child of current node
            foreach (Node<T> child in node.Children)
            {
                SetNodesInLevel(child, levelIndex + 1);
            }
        }

        public VisualNode<T> GetVisualTree(Node<T> node)
        {
            VisualNode<T> vn = new VisualNode<T>(node.ShapeMiddle, node.Data);

            foreach (Node<T> childNode in node.Children)
            {
                VisualNode<T> childVn = GetVisualTree(childNode);
                vn.Children.Add(childVn);
            }

            return vn;
        }
    }
}
