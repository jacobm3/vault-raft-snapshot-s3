#!/bin/bash

BUCKET=your-bucket

# make bucket
aws s3 mb s3://${BUCKET}

# create lifecycle configuration
cat > lifecycle.json <<EOF
{
    "Rules": [
        {
            "Filter": {
                "Prefix": "snap/"
            },
            "Status": "Enabled",
            "Transitions": [
                {
                    "Days": 31,
                    "StorageClass": "GLACIER"
                }
            ],
            "Expiration": {
                "Days": 183
            },
            "ID": "30DaysToGlacier6MonthExpire"
        }
    ]
}
EOF

# apply lifecycle to bucket
aws s3api put-bucket-lifecycle-configuration \
--bucket $BUCKET \
--lifecycle-configuration file://lifecycle.json


