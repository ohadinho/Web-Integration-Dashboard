using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Schema;
using System.IO;
using System.Xml;

namespace Validators
{
    /// <SUMMARY>
    /// This class validates an xml string or xml document against an xml
    /// schema.
    /// It has public methods that return a boolean value depending on 
    /// the validation
    /// of the xml.
    /// </SUMMARY>
    public class XmlSchemaValidator : IValidator
    {
        private bool isValidXml = true;
        private string validationError = String.Empty;
        private string schemaNamespace;
        private string schemaUri;

        public XmlSchemaValidator(string schemaNamespace, string schemaUri)
        {
            this.SchemaNamespace = schemaNamespace;
            this.SchemaUri = schemaUri;
        }

        public String SchemaNamespace
        {
            get
            {
                return this.schemaNamespace;
            }
            set
            {
                this.schemaNamespace = value;
            }
        }

        public String SchemaUri
        {
            get
            {
                return this.schemaUri;
            }
            set
            {
                this.schemaUri = value;
            }
        }

        /// <SUMMARY>
        /// Public get/set access to the validation error.
        /// </SUMMARY>
        public String ValidationError
        {
            get
            {
                return this.validationError;
            }
            set
            {
                this.validationError = value;
            }
        }

        /// <SUMMARY>
        /// Public get access to the isValidXml attribute.
        /// </SUMMARY>
        public bool IsValidXml
        {
            get
            {
                return this.isValidXml;
            }
        }

        /// <SUMMARY>
        /// This method is invoked when the XML does not match
        /// the XML Schema.
        /// </SUMMARY>
        /// <PARAM name="sender"></PARAM>
        /// <PARAM name="args"></PARAM>
        private void ValidationCallBack(object sender,
                                   ValidationEventArgs args)
        {
            // The xml does not match the schema.
            isValidXml = false;
            this.ValidationError = args.Message;
        }


        /// <SUMMARY>
        /// This method validates an xml string against an xml schema.
        /// </SUMMARY>
        /// <PARAM name="xml">XML string</PARAM>
        /// <PARAM name="schemaNamespace">XML Schema Namespace</PARAM>
        /// <PARAM name="schemaUri">XML Schema Uri</PARAM>
        /// <RETURNS>bool</RETURNS>
        public bool Validate(string input)
        {
            try
            {
                // Is the xml string valid?
                if (input == null || input.Length < 1)
                {
                    return false;
                }

                StringReader srXml = new StringReader(input);
                return ValidXmlDoc(srXml);
            }
            catch (Exception ex)
            {
                this.ValidationError = ex.Message;
                return false;
            }
        }

        /// <SUMMARY>
        /// This method validates an xml document against an xml 
        /// schema.
        public bool ValidXmlDoc(XmlDocument xml)
        {
            try
            {
                // Is the xml object valid?
                if (xml == null)
                {
                    return false;
                }

                // Create a new string writer.
                StringWriter sw = new StringWriter();
                // Set the string writer as the text writer 
                // to write to.
                XmlTextWriter xw = new XmlTextWriter(sw);
                // Write to the text writer.
                xml.WriteTo(xw);
                // Get 
                string strXml = sw.ToString();

                StringReader srXml = new StringReader(strXml);

                return ValidXmlDoc(srXml);
            }
            catch (Exception ex)
            {
                this.ValidationError = ex.Message;
                return false;
            }
        }

        /// <SUMMARY>
        /// This method validates an xml string against an xml schema.
        /// </SUMMARY>
        /// <PARAM name="xml">StringReader containing xml</PARAM>
        /// <PARAM name="schemaNamespace">XML Schema Namespace</PARAM>
        /// <PARAM name="schemaUri">XML Schema Uri</PARAM>
        /// <RETURNS>bool</RETURNS>
        public bool ValidXmlDoc(StringReader xml)
        {
            // Continue?
            if (xml == null || this.SchemaNamespace == null || this.SchemaUri == null)
            {
                return false;
            }

            isValidXml = true;            
            
            try
            {
                // Read the xml.
                using (XmlTextReader tr = new XmlTextReader(xml))
                {
                    XmlReaderSettings settings = new XmlReaderSettings();
                    settings.ValidationType = ValidationType.Schema;
                    settings.Schemas.Add(this.SchemaNamespace, this.SchemaUri);
                    settings.ValidationEventHandler += new ValidationEventHandler(ValidationCallBack);

                    // Create a validating reader that wraps the XmlNodeReader object.
                    using (XmlReader reader = XmlReader.Create(tr, settings))
                    {
                        // Parse the XML file.
                        while (reader.Read()) ;
                        reader.Close();
                    }
                }

                return isValidXml;
            }
            catch (Exception ex)
            {
                this.ValidationError = ex.Message;
                return false;
            }            
        }
    }
}
