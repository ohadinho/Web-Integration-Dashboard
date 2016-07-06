using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TreeNodes
{
    public class Node<T> where T : GUIDTree
    {
        public Node<T> Parent { get; set; }
        public List<Node<T>> Children { get; set; }
        public List<Node<T>> Siblings { get; set; }
        public Segment BelongTo { get; set;}
        public Point ShapeMiddle { get; set; }
        public T Data { get; set; }
        public int Level { get; set; }
        public static readonly int ShapeSegmentWidth = 300;
        public static readonly int ShapeSegmentHeight = 200;

        public Node(Node<T> parent, T data)
        {            
            this.Parent = parent;
            this.Data = data;
            this.Children = new List<Node<T>>();
            this.Siblings = new List<Node<T>>();
            this.BelongTo = new Segment();                     
        }        
    }
}
