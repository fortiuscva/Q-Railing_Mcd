pageextension 50122 McdPostedSalesInvoiceSubform extends "Posted Sales Invoice Subform"
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
