pageextension 50123 McdPostedSalesCrMemoSubform extends "Posted Sales Cr. Memo Subform"
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
