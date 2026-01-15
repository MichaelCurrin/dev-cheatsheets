# openssl

To download a certificate from a remote server using OpenSSL, you typically use the `s_client` command. This connects to the server and retrieves the certificate chain, which you can then save to a file.

### Download the Primary (Leaf) Certificate

Use this command to download only the server's primary certificate and save it as `cert.pem`.

```bash
openssl s_client -connect example.com:443 -servername example.com </dev/null | openssl x509 -outform PEM > cert.pem
```

* **`-connect example.com:443`**: Specifies the host and port.
* **`-servername example.com`**: Essential for **SNI** (Server Name Indication) to ensure you get the correct certificate if the IP hosts multiple domains.
* **`</dev/null`**: Immediately sends an EOF so the connection closes after receiving the certificate, rather than waiting for user input.
* **`openssl x509 -outform PEM`**: Filters the output to capture only the certificate in a usable PEM format.

### Download the Entire Certificate Chain

If you need the full chain (the server cert plus all intermediate certificates), use the `-showcerts` flag.

```bash
openssl s_client -showcerts -connect example.com:443 -servername example.com </dev/null > full_chain.pem
```

> **Note:** This command captures everything, including the handshake details. To extract *only* the certificates from this output into a clean file, you can pipe it through `sed`:

```bash
openssl s_client -showcerts -connect example.com:443 -servername example.com </dev/null | sed -n '/-----BEGIN CERTIFICATE-----/,/-----END CERTIFICATE-----/p' > chain_only.pem
```

###  Verify the Downloaded Certificate

Once downloaded, you can view the details (expiration date, issuer, etc.) to make sure it’s correct:

```bash
openssl x509 -in cert.pem -text -noout
```


### Summary Table: Common Options

| Task | Command Flag | Why use it? |
| --- | --- | --- |
| **Specify Domain** | `-servername [domain]` | Required for modern sites using SNI. |
| **Include Intermediates** | `-showcerts` | Useful for fixing "Chain of Trust" errors. |
| **Output Format** | `-outform DER` | Use if you need a binary `.cer` or `.der` file instead of text PEM. |

