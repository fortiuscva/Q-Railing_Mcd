pageextension 50107 McdItemList extends "Item List"
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
        addfirst(factboxes)
        {
            part(ItemSupplyFactbox; TOMItemSupplyFactbox)
            {
                ApplicationArea = All;
                SubPageLink = "No."=field("No.");
            }
        }
        addafter(ItemSupplyFactbox)
        {
            part(ItemDemandFactbox; TOMItemDemandFactbox)
            {
                ApplicationArea = All;
                SubPageLink = "No."=field("No.");
            }
        }
    }
}
