codeunit 50100 "OnNewCurrency"
{
    trigger OnRun()
    var
        myInt: Integer;
    begin

    end;

    [EventSubscriber(ObjectType::Table, 18, 'OnAfterValidateEvent', 'Address', false, false)]
    procedure OnCustomerAdresseValidate(var Rec: Record Customer; var xRec: Record Customer; CurrFieldNo: Integer);
    begin
        Message('OnCustomerAdresseValidate');
        CheckForPlusSign(Rec.Address);
    end;

    [EventSubscriber(ObjectType::Page, 21, 'OnAfterValidateEvent', 'Address', false, false)]
    procedure OnCustomerPageAddressValidate(var Rec: Record Customer; var xRec: Record Customer);
    begin
        MESSAGE('OnCustomerPageAddressValidate');
        CheckForPlusSign(Rec.Address);
    end;

    procedure CheckForPlusSign(TextToVerify: Text)
    begin
        if (STRPOS(TextToVerify, '+') > 0) then begin
            ;
            MESSAGE('Cannot use a plus sign (+) in the address [' + TextToVerify + ']');
        end;
    end;
}