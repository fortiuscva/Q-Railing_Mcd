pageextension 50124 McdPostedSalesShptSubform extends "Posted Sales Shpt. Subform"
{
    layout
    {
        addafter("Gross Weight")
        {
            field(McdInnerSalespersonCode; Rec.McdInnerSalespersonCode)
            {
                ApplicationArea = All;
            }
            field(McdOuterSalespersonCode; Rec.McdOuterSalespersonCode)
            {
                ApplicationArea = All;
            }
        }
    }
}
