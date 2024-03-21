pageextension 50106 McdItem extends "Item Card"
{
    layout
    {
        addafter(Description)
        {
            field("McdMasterItemNo."; Rec."McdMasterItemNo.")
            {
                ApplicationArea = All;
            }
            field(McdSize; Rec.McdSize)
            {
                ApplicationArea = All;
            }
            field(McdColor; Rec.McdColor)
            {
                ApplicationArea = All;
            }
            field(McdStyle; Rec.McdStyle)
            {
                ApplicationArea = All;
            }
        }
    }
}
