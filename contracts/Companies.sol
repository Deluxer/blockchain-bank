pragma solidity ^0.8.10;

library Shared {
        struct Company {
        string name;
        string area;
        uint employees;
    }

}
contract CompaniesCountries {

    mapping(string => Shared.Company[]) public companies;

    function getCompanyByCountry(string calldata country) public view returns(Shared.Company[] memory) {
        return companies[country];
    }

    function addCompanyAddCountry(Shared.Company calldata company, string calldata country) public {
        companies[country].push(company);
    } 

}

contract Companies {

    Shared.Company[] public arrayCompanies;

    function addCompany(string calldata _name, string calldata _area, uint _employees) public {
        arrayCompanies.push(Shared.Company(_name, _area, _employees));
    }

    function getCompanyByName(string calldata companyName) public view returns(Shared.Company memory) {
        for( uint i = 0; i < arrayCompanies.length; i++) {
            if (keccak256(bytes(arrayCompanies[i].name)) == keccak256(bytes(companyName))) {
                return arrayCompanies[i];
            }
        }

        revert('Not found');
    }

    function deleteCompanyByName(string calldata companyName) public {
        for( uint i = 0; i < arrayCompanies.length; i++) {
            if (keccak256(bytes(arrayCompanies[i].name)) == keccak256(bytes(companyName))) {
                delete arrayCompanies[i];

                for( uint j = 0; j < arrayCompanies.length-1; j++) {
                    arrayCompanies[j] = arrayCompanies[j+1];
                }

                arrayCompanies.pop();
                return;
            }
        }
        
    }

    function getCompaniesByAreaAndEmployees(string calldata area, uint employees) public view returns(Shared.Company[] memory) {
        
        uint numCoincidencias = 0;
        for( uint i = 0; i < arrayCompanies.length; i++) {
            if (keccak256(bytes(arrayCompanies[i].area)) == keccak256(bytes(area)) && arrayCompanies[i].employees == employees) {
                    numCoincidencias++;
            }
        }

        Shared.Company[] memory coincidencias = new Shared.Company[](numCoincidencias);
        uint posicionInsertar = 0;
        for( uint i = 0; i < arrayCompanies.length; i++) {
            if (keccak256(bytes(arrayCompanies[i].area)) == keccak256(bytes(area)) && arrayCompanies[i].employees == employees) {
                    coincidencias[posicionInsertar] = arrayCompanies[i];
                    posicionInsertar++;
            }
        }

        return coincidencias;
    }

}