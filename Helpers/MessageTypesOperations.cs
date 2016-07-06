using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Validators;
using System.IO;

namespace Helpers
{
    public class MessageTypesOperations
    {
        public static string Validate(string type, string input)
        {
            String errorDesc = String.Empty;

            switch (type)
            {
                case "Schema1":
                    XmlSchemaValidator schemaValidator1 = new XmlSchemaValidator(Constants.Schema1.targetNS, Constants.Schema1.schemaLocation);
                    schemaValidator1.Validate(input);
                    errorDesc = schemaValidator1.ValidationError;
                    break;

                case "Schema2":
                    XmlSchemaValidator schemaValidator2 = new XmlSchemaValidator(Constants.Schema2.targetNS, Constants.Schema2.schemaLocation);
                    schemaValidator2.Validate(input);
                    errorDesc = schemaValidator2.ValidationError;
                    break;

                case "HL7":
                    break;
            }


            return errorDesc;
        }

        public static string ReadFileOfMessageType(string type, Stream inputStream)
        {
            string text = String.Empty;

            switch (type)
            {
                case "MTW":
                    text = ReadFile(inputStream, System.Text.Encoding.UTF8);
                    break;

                case "CDA":
                    text = ReadFile(inputStream, System.Text.Encoding.UTF8);
                    break;

                case "HL7":
                    break;
            }

            return text;
        }

        private static string ReadFile(Stream inputStream, Encoding encoding)
        {
            string text = String.Empty;

            using (StreamReader srMTW = new StreamReader(inputStream, System.Text.Encoding.UTF8))
            {
                text = srMTW.ReadToEnd();                
            }

            return text;
        }
    }
}
