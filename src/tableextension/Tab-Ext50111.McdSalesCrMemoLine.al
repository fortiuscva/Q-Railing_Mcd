tableextension 50111 McdSalesCrMemoLine extends "Sales Cr.Memo Line"
{
    fields
    {
        field(50101; McdInnerSalespersonCode; Code[20])
        {
            Caption = 'Inner Salesperson Code';
            //TableRelation = "Salesperson/Purchaser" where(Blocked = const(false));
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Cr.Memo Header"."Salesperson Code" where("No."=field("Document No.")));
        }
        field(50102; McdOuterSalespersonCode; Code[20])
        {
            Caption = 'Outer Salesperson Code';
            //TableRelation = "Salesperson/Purchaser" where(Blocked = const(false));
            FieldClass = FlowField;
            CalcFormula = lookup("Sales Cr.Memo Header".McdOuterSalespersonCode where("No."=field("Document No.")));
        }
    }
}
