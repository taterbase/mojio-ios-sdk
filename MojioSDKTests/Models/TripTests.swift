/******************************************************************************
 * Moj.io Inc. CONFIDENTIAL
 * 2017 Copyright Moj.io Inc.
 * All Rights Reserved.
 *
 * NOTICE:  All information contained herein is, and remains, the property of
 * Moj.io Inc. and its suppliers, if any.  The intellectual and technical
 * concepts contained herein are proprietary to Moj.io Inc. and its suppliers
 * and may be covered by Patents, pending patents, and are protected by trade
 * secret or copyright law.
 *
 * Dissemination of this information or reproduction of this material is strictly
 * forbidden unless prior written permission is obtained from Moj.io Inc.
 *******************************************************************************/

@testable import MojioSDK
import ObjectMapper
import XCTest

class TripTests: XCTestCase {
    
    func testTripModelShouldBeCreatedFromJsonString() {
        let jsonObject = try! JSONSerialization.jsonObject(with: jsonString.data(using: .utf8)!, options: .allowFragments)
        let model = Mapper<Trip>().map(JSONObject: jsonObject)

        XCTAssertNotNil(model)
        XCTAssertEqual(model?.VehicleId, "00000000-0000-0000-0000-000000000000")
        XCTAssertEqual(model?.Name, "string")
        XCTAssertEqual(model?.MojioId, "00000000-0000-0000-0000-000000000000")
        XCTAssertEqual(model?.OwnerId, "00000000-0000-0000-0000-000000000000")
        XCTAssertEqual(model?.Completed, true)
        XCTAssertEqual(model?.TripDuration, "string")
        XCTAssertNotNil(model?.TripDistance)
        XCTAssertEqual(model?.StartTimestamp, "2017-11-10T07:07:44.298Z")
        XCTAssertEqual(model?.EndTimestamp, "2017-11-10T07:07:44.298Z")
        XCTAssertNotNil(model?.StartOdometer)
        XCTAssertNotNil(model?.EndOdometer)
        XCTAssertNotNil(model?.StartLocation)
        XCTAssertNotNil(model?.EndLocation)
        XCTAssertNotNil(model?.MaxSpeed)
        XCTAssertNotNil(model?.MaxRPM)
        XCTAssertNotNil(model?.MaxAcceleration)
        XCTAssertNotNil(model?.MaxDeceleration)
        XCTAssertEqual(model?.Polyline, "string")
        XCTAssertNotNil(model?.HarshEvents)
        XCTAssertNotNil(model?.IdleEvents)
        XCTAssertNotNil(model?.TripFuelEfficiency)
        XCTAssertNotNil(model?.StartFuelLevel)
        XCTAssertNotNil(model?.EndFuelLevel)
        XCTAssertEqual(model?.IdlingCount, 0)
        XCTAssertEqual(model?.HarshAccelCount, 0)
        XCTAssertEqual(model?.HarshDecelCount, 0)
        XCTAssertEqual(model?.Id, "00000000-0000-0000-0000-000000000000")
        XCTAssertEqual(model?.CreatedOn, "2017-11-10T07:07:44.300Z")
        XCTAssertEqual(model?.LastModified, "2017-11-10T07:07:44.300Z")
        XCTAssertNotNil(model?.Tags)
    }
}

extension TripTests {
    var jsonString: String {
        return """
        {
        "VehicleId": "00000000-0000-0000-0000-000000000000",
        "Name": "string",
        "Tags": [
        "string"
        ],
        "MojioId": "00000000-0000-0000-0000-000000000000",
        "OwnerId": "00000000-0000-0000-0000-000000000000",
        "Completed": true,
        "Duration": "string",
        "StartTimestamp": "2017-11-10T07:07:44.298Z",
        "EndTimestamp": "2017-11-10T07:07:44.298Z",
        "StartOdometer": {
        "RolloverValue": 0,
        "BaseUnit": "Meters",
        "Timestamp": "2017-11-10T07:07:44.298Z",
        "BaseValue": 0,
        "Unit": "Meters",
        "Value": 0
        },
        "EndOdometer": {
        "RolloverValue": 0,
        "BaseUnit": "Meters",
        "Timestamp": "2017-11-10T07:07:44.298Z",
        "BaseValue": 0,
        "Unit": "Meters",
        "Value": 0
        },
        "StartLocation": {
        "Timestamp": "2017-11-10T07:07:44.298Z",
        "Lat": 0,
        "Lng": 0,
        "Status": "Unknown",
        "Dilution": 0,
        "Altitude": 0,
        "GeoHash": "string",
        "Accuracy": {
        "BaseUnit": "Meters",
        "Timestamp": "2017-11-10T07:07:44.298Z",
        "BaseValue": 0,
        "Unit": "Meters",
        "Value": 0
        },
        "Heading": {
        "BaseUnit": "Degree",
        "Direction": "string",
        "LeftTurn": true,
        "Timestamp": "2017-11-10T07:07:44.298Z",
        "BaseValue": 0,
        "Unit": "Degree",
        "Value": 0
        },
        "Address": {
        "HouseNumber": "string",
        "Road": "string",
        "Neighbourhood": "string",
        "Suburb": "string",
        "City": "string",
        "County": "string",
        "State": "string",
        "PostCode": "string",
        "Country": "string",
        "CountryCode": "string",
        "FormattedAddress": "string"
        }
        },
        "EndLocation": {
        "Timestamp": "2017-11-10T07:07:44.299Z",
        "Lat": 0,
        "Lng": 0,
        "Status": "Unknown",
        "Dilution": 0,
        "Altitude": 0,
        "GeoHash": "string",
        "Accuracy": {
        "BaseUnit": "Meters",
        "Timestamp": "2017-11-10T07:07:44.299Z",
        "BaseValue": 0,
        "Unit": "Meters",
        "Value": 0
        },
        "Heading": {
        "BaseUnit": "Degree",
        "Direction": "string",
        "LeftTurn": true,
        "Timestamp": "2017-11-10T07:07:44.299Z",
        "BaseValue": 0,
        "Unit": "Degree",
        "Value": 0
        },
        "Address": {
        "HouseNumber": "string",
        "Road": "string",
        "Neighbourhood": "string",
        "Suburb": "string",
        "City": "string",
        "County": "string",
        "State": "string",
        "PostCode": "string",
        "Country": "string",
        "CountryCode": "string",
        "FormattedAddress": "string"
        }
        },
        "Distance": {
        "BaseUnit": "Meters",
        "Timestamp": "2017-11-10T07:07:44.299Z",
        "BaseValue": 0,
        "Unit": "Meters",
        "Value": 0
        },
        "MaxSpeed": {
        "BaseUnit": "KilometersPerHour",
        "Timestamp": "2017-11-10T07:07:44.299Z",
        "BaseValue": 0,
        "Unit": "KilometersPerHour",
        "Value": 0
        },
        "MaxRPM": {
        "BaseUnit": "RevolutionsPerMinute",
        "Timestamp": "2017-11-10T07:07:44.299Z",
        "BaseValue": 0,
        "Unit": "RevolutionsPerMinute",
        "Value": 0
        },
        "MaxAcceleration": {
        "BaseUnit": "MetersPerSecondPerSecond",
        "Timestamp": "2017-11-10T07:07:44.299Z",
        "BaseValue": 0,
        "Unit": "MetersPerSecondPerSecond",
        "Value": 0
        },
        "MaxDeceleration": {
        "BaseUnit": "MetersPerSecondPerSecond",
        "Timestamp": "2017-11-10T07:07:44.299Z",
        "BaseValue": 0,
        "Unit": "MetersPerSecondPerSecond",
        "Value": 0
        },
        "Polyline": "string",
        "HarshEvents": [
        {
        "HarshEventState": {
        "Timestamp": "2017-11-10T07:07:44.299Z",
        "Value": true,
        "EventType": "Acceleration",
        "TurnType": "Left"
        },
        "Location": {
        "Timestamp": "2017-11-10T07:07:44.299Z",
        "Lat": 0,
        "Lng": 0,
        "Status": "Unknown",
        "Dilution": 0,
        "Altitude": 0,
        "GeoHash": "string",
        "Accuracy": {
        "BaseUnit": "Meters",
        "Timestamp": "2017-11-10T07:07:44.299Z",
        "BaseValue": 0,
        "Unit": "Meters",
        "Value": 0
        },
        "Heading": {
        "BaseUnit": "Degree",
        "Direction": "string",
        "LeftTurn": true,
        "Timestamp": "2017-11-10T07:07:44.299Z",
        "BaseValue": 0,
        "Unit": "Degree",
        "Value": 0
        },
        "Address": {
        "HouseNumber": "string",
        "Road": "string",
        "Neighbourhood": "string",
        "Suburb": "string",
        "City": "string",
        "County": "string",
        "State": "string",
        "PostCode": "string",
        "Country": "string",
        "CountryCode": "string",
        "FormattedAddress": "string"
        }
        }
        }
        ],
        "IdleEvents": [
        {
        "IdleState": {
        "Timestamp": "2017-11-10T07:07:44.299Z",
        "Value": true,
        "StartTime": "2017-11-10T07:07:44.299Z",
        "Duration": {
        "BaseUnit": "Ticks",
        "Timestamp": "2017-11-10T07:07:44.299Z",
        "BaseValue": 0,
        "Unit": "Ticks",
        "Value": 0
        }
        },
        "Location": {
        "Timestamp": "2017-11-10T07:07:44.299Z",
        "Lat": 0,
        "Lng": 0,
        "Status": "Unknown",
        "Dilution": 0,
        "Altitude": 0,
        "GeoHash": "string",
        "Accuracy": {
        "BaseUnit": "Meters",
        "Timestamp": "2017-11-10T07:07:44.300Z",
        "BaseValue": 0,
        "Unit": "Meters",
        "Value": 0
        },
        "Heading": {
        "BaseUnit": "Degree",
        "Direction": "string",
        "LeftTurn": true,
        "Timestamp": "2017-11-10T07:07:44.300Z",
        "BaseValue": 0,
        "Unit": "Degree",
        "Value": 0
        },
        "Address": {
        "HouseNumber": "string",
        "Road": "string",
        "Neighbourhood": "string",
        "Suburb": "string",
        "City": "string",
        "County": "string",
        "State": "string",
        "PostCode": "string",
        "Country": "string",
        "CountryCode": "string",
        "FormattedAddress": "string"
        }
        }
        }
        ],
        "FuelEfficiency": {
        "BaseUnit": "MilesPerGallon",
        "Timestamp": "2017-11-10T07:07:44.300Z",
        "BaseValue": 0,
        "Unit": "MilesPerGallon",
        "Value": 0
        },
        "StartFuelLevel": {
        "BaseUnit": "Percentage",
        "RiskSeverity": "Unknown",
        "Timestamp": "2017-11-10T07:07:44.300Z",
        "BaseValue": 0,
        "Unit": "Percentage",
        "Value": 0
        },
        "HarshAcclCount": 0,
        "HarshDecelCount": 0,
        "IdlingCount": 0,
        "EndFuelLevel": {
        "BaseUnit": "Percentage",
        "RiskSeverity": "Unknown",
        "Timestamp": "2017-11-10T07:07:44.300Z",
        "BaseValue": 0,
        "Unit": "Percentage",
        "Value": 0
        },
        "Id": "00000000-0000-0000-0000-000000000000",
        "CreatedOn": "2017-11-10T07:07:44.300Z",
        "LastModified": "2017-11-10T07:07:44.300Z",
        "Deleted": true,
        "Metadata": {},
        "Links": {}
        }
        """
    }
}