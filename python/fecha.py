from datetime import datetime
now = datetime.now()

print '%s/%02d/%02d' % (now.year, now.month, now.day+60)