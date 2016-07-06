using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Validators
{
    public interface IValidator
    {
        String ValidationError
        {
            get;
            set;
        }

        bool Validate(string input);       
    }
}
