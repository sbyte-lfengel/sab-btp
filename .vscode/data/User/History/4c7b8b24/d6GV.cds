 namespace hc450.officesupplies;
   
 3   using {Currency} from '@sap/cds/common';
 4   
 5   entity Products {
 6    @Common.Label : 'UUID'
 7    key ID : UUID;
 8    identifier : String @Common.Label : 'ProductID';
 9    title : localized String @(Common.Label : 'Name');
10    description : localized String;
11    availability : Integer;
12    storage_capacity : Integer;
13    criticality : Integer;
14    price : Decimal(9, 2);
15    currency : Currency;
16    supplier : Association to Suppliers;
17    image_url : String;
18   }
19   
20   entity Suppliers {
21    key ID : UUID;
22    identifier : String;
23    name : String;
24    phone : String;
25    building : String;
26    street : String @multiline;
27    postCode : String;
28    city : String;
29    country : String;
30    products : Composition of many Products
31    on products.supplier = $self;
32   }