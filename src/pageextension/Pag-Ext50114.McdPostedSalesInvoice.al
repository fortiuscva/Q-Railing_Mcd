pageextension 50114 McdPostedSalesInvoice extends "Posted Sales Invoice"
{
    layout
    {
        addafter("Location Code")
        {
            field(McdShippingNote; Rec.McdShippingNote)
            {
                ApplicationArea = All;
            }
        }
        addafter("Salesperson Code")
        {
            field(McdInnerSalespersonCode; Rec.McdOuterSalespersonCode)
            {
                ApplicationArea = All;
            }
        }
        modify("Salesperson Code")
        {
            Caption = 'Inner Salesperson Code';
        }
    }
}
