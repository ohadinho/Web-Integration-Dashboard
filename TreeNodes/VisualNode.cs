using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TreeNodes
{
    public class VisualNode<T> where T : GUIDTree
    {
        public List<VisualNode<T>> Children { get; set; }
        public Point ShapeMiddle { get; set; }
        public T Data { get; set; }

        public VisualNode(Point shapeMiddle, T data)
        {
            this.Children = new List<VisualNode<T>>();
            this.ShapeMiddle = shapeMiddle;
            this.Data = data;            
        }
    }
}
