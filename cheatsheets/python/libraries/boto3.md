---
title: boto3
description: AWS SDK for Python 
---

## Resources

- [boto3](https://pypi.org/project/boto3/) on PyPi.


## Example

```python
import boto3


s3_client = boto3.client('s3')

s3_client.download_file(bucket, key, download_path)
s3_client.upload_file(upload_path, f'{bucket}-resized', key)
```
