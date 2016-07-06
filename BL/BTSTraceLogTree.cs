using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TreeNodes;

namespace BL
{
    public class BTSTraceLogTree
    {
        public static string GetJsonTree(List<BTSTraceLog> list)
        {
            NonBinaryTree<BTSTraceLog> nbt = new NonBinaryTree<BTSTraceLog>(list);
            Node<BTSTraceLog> root = nbt.CreateTree();
            StringBuilder str = new StringBuilder();
            str.Append("{ \"chart\": { \"container\": \"#custom-colored\",\"nodeAlign\": \"BOTTOM\",\"connectors\": {\"type\": \"step\"},\"node\": {\"HTMLclass\": \"nodeExample1\"}},\"nodeStructure\": {");
            BuildTree(root, str);
            str.Append("}}");

            string result = str.ToString();
            //result = "{ \"chart\" : { 'container': '#custom-colored', nodeAlign: 'BOTTOM', connectors: { type: 'step' }, node: { HTMLclass: 'nodeExample1' }};";
            return result;
        }

        private static void BuildTree(Node<BTSTraceLog> currentNode, StringBuilder str)
        {
            string strSrvKey1 = GetStringValueOfData("SrvKey1", currentNode.Data.SrvKey1);
            string strSrvKey2 = GetStringValueOfData("SrvKey2", currentNode.Data.SrvKey2);
            string strSrvKey3 = GetStringValueOfData("SrvKey3", currentNode.Data.SrvKey3);
            string strSQLIdentity = GetStringValueOfData("SQLIdentity", currentNode.Data.TargetTransactionID);
            string fullExceptionText = currentNode.Data.FullExceptionText;
            string shortExceptionText = !fullExceptionText.Equals(String.Empty) ? fullExceptionText.Substring(0,fullExceptionText.IndexOf("Message ID") - 2) : fullExceptionText;            
            string exceptionText = GetStringValueOfData(String.Empty, shortExceptionText);

            // Adds current node text
            str.AppendFormat("\"text\": {{ \"name\": \"{0}\", \"title\": \"{1}\" }}", currentNode.Data.SrvName, strSrvKey1 + strSrvKey2 + strSrvKey3 + strSQLIdentity + exceptionText, ""/*currentNode.Data.FullExceptionText*/);

            // Failure = painting current node background in red, In all other cases = "Green"
            if (currentNode.Data.StatusCode == Convert.ToInt32(eStatusCode.Failure).ToString())
            {
                str.Append(",");
                str.Append("\"HTMLclass\": \"light-coral\"");
            }
            else
            {
                str.Append(",");
                str.Append("\"HTMLclass\": \"light-green\"");
            }

            if (currentNode.Children.Count > 0)
            {
                str.Append(",");
                str.Append("\"children\": [");

                foreach (Node<BTSTraceLog> childNode in currentNode.Children)
                {
                    str.Append("{");
                    BuildTree(childNode, str);
                    str.Append("},");
                }

                // Removes the last "," sign because there is no more children
                str.Length--;
                // Closing the children tag
                str.Append("]");
            }
        }
        
        private static string GetStringValueOfData(string propertyName, string property)
        {
           property = property.Replace("\\", "\\\\");
           string result = !property.Equals(String.Empty) ? propertyName + ": " + property + ", " : String.Empty;            
           return result;
        }
    }
}
