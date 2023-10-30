import pyotp

secret_key = "YOUR_MFA_SECRET_KEY"  # Replace with your MFA secret key
totp = pyotp.TOTP(secret_key)
mfa_token = totp.now()

print(mfa_token)