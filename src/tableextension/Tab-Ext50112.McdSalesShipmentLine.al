tableextension 50112 McdSalesShipmentLine extends "Sales Shipment Line"
{
    fields
    {
        field(50101; McdInnerSalespersonCode; Code[20])
        {
            Caption = 'Inner Salesperson Code';
            //TableRelation = "Salesperson/Purchaser" where(Blocked = const(false));
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Sales shipment Header"."Salesperson Code" where("No." = field("Document No.")));
        }
        field(50102; McdOuterSalespersonCode; Code[20])
        {
            Caption = 'Outer Salesperson Code';
            Editable = false;
            //TableRelation = "Salesperson/Purchaser" where(Blocked = const(false));
            FieldClass = FlowField;
            CalcFormula = lookup("Sales shipment Header".McdOuterSalespersonCode where("No." = field("Document No.")));
        }
    }
}
