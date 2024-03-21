pageextension 50117 McdCustomerCard extends "Customer Card"
{
    layout
    {
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
