# Duplicacy 

(Work in progress) fork of [azinchen/duplicacy][duplicacy-azinchen] with the aim the of adding "check" action and sequencing actions on the same schedule

[![Docker pulls][dockerhub-pulls]][dockerhub-link]
[![Docker image size][dockerhub-size]][dockerhub-link]
[![GitHub release date][github-releasedate]][github-link]
[![GitHub build][github-build]][github-link]
[![GitHub last commit][github-lastcommit]][github-link]

`azinchen/duplicacy` is a Docker image created to easily perform automated backups. It uses [Duplicacy][duplicacy-home] under the hood, and therefore supports:

- Multiple storage backends: S3, Backblaze B2, Hubic, Dropbox, SFTP...
- Client-side encryption
- Deduplication
- Multi-versioning
- ... and more generally, all the features that duplicacy has.

`azinchen/duplicacy` uses [Duplicacy Command Line version][duplicacy-github] `3.1.0`.

## Supported Architectures

The image supports multiple architectures such as `amd64`, `x86`, `arm/v6`, `arm/v7` and `arm64`.

## Starting a Duplicacy instance

You can run the following command to launch a standalone instance of Duplicacy on Docker:

```bash
docker run \
  -v path_to_data:/data \
  -e BACKUP_CRON="0 1 * * *" \
  -e SNAPSHOT_ID="id" \
  -e STORAGE_URL="url" \
    ....duplicacy
```

## Environment variables

Container images are configured using environment variables passed at runtime.
| Parameter | Function |
| :----: | --- |
| `BACKUP_CRON` | Set schedule for `duplicacy backup` command formatted for crontab file. The `duplicacy backup` command doesn't run if `BACKUP_CRON` is not set. |
| `PRUNE_CRON` | Set schedule for `duplicacy prune` command formatted for crontab file. The `duplicacy prune` command doesn't run if `PRUNE_CRON` is not set. |
| `PRUNE_ADD` | yes or empyty. Adds `duplicacy prune` immediately after `duplicacy backup`. Ignored if `PRUNE_CRON` is set. |
| `CHECK_CRON` | Set schedule for `duplicacy check` command formatted for crontab file. The `duplicacy check` command doesn't run if `CHECK_CRON` is not set. |
| `CHECK_ADD` | yes or empyty. Adds `duplicacy check` immediately after `duplicacy backup/prune`. Ignored if `CHECK_CRON` is set. |
| `BACKUP_END_CRON` | Set schedule for force killing of duplicacy backup process formatted for crontab file. The force killing of duplicacy backup process doesn't run if `BACKUP_END_CRON` is not set. |
| `GLOBAL_OPTIONS` | Set global options for each `duplicacy` command, see ["Global options details"][duplicacy-global-options] for details. Global options are not set by default. |
| `BACKUP_OPTIONS` | Set options for each `duplicacy backup` command, see `duplicacy backup` command [description][duplicacy-backup] for details. Backup options are not set by default. |
| `PRUNE_OPTIONS` | Set options for each `duplicacy prune` command, see `duplicacy prune` command [description][duplicacy-prune] for details. Prune options are not set by default. |
| `CHECK_OPTIONS` | Set options for each `duplicacy check` command, see `duplicacy check` command [description][duplicacy-check] for details. Prune options are not set by default. |
| `RUN_JOB_IMMEDIATELY` | Set to `yes` to run `duplicacy backup` and/or `duplicacy prune` and/or `duplicacy check` commands at container startup. The jobs don't start by default. |
| `SNAPSHOT_ID` | Set snapshot id, see `duplicacy init` command [description][duplicacy-init] for details. |
| `STORAGE_URL` | Set storage url, see `duplicacy init` command [description][duplicacy-init] for details. Duplicacy supports different storage providers, see ["Supported storage backends"][duplicacy-storage] for details. Login credentials for storage url should be set using environment variables, see ["Passwords, credentials and environment variables"][duplicacy-variables] for details. |
| `JOB_RANDOM_DELAY` | Set maximum value of delay before job startup, in seconds. Jobs run without delay by default. |
| `PRUNE_KEEP_POLICIES` | Set keep options for `duplicacy prune` command, see `duplicacy prune` command [description][duplicacy-prune] for details. Several keep options can be set using semicolon as delimeter. |
| `FILTER_PATTERNS` | Set filter patterns, see ["Filters/Include exclude patterns"][duplicacy-filters] for details. Several filter patterns can be defined using semicolon as delimeter. |
| `DUPLICACY_PASSWORD` | Enable encryption for storage and set password, see `duplicacy init` command [description][duplicacy-init] for details. Encryption is disabled by default. |
| `EMAIL_HOSTNAME_ALIAS` | Set host alias in email reports. Hostname of container is used by default. |
| `EMAIL_FROM` | Set sender email. |
| `EMAIL_FROM_NAME` | Set sender name. |
| `EMAIL_TO` | Set recipient email. |
| `EMAIL_USE_TLS` | Enable encryption in session with SMTP server. |
| `EMAIL_SMTP_SERVER` | Set SMTP server address. |
| `EMAIL_SMTP_SERVER_PORT` | Set SMTP server port. |
| `EMAIL_SMTP_LOGIN` | Set SMTP server login. |
| `EMAIL_SMTP_PASSWORD` | Set SMTP server password. |
| `EMAIL_LOG_LINES_IN_BODY` | Set the number of lines from the beginning and from the end of the log and put it in the body of the email report. Default value is `10`. |
| `SEND_REPORT_LEVEL` | Send email reports with level lower than defined. Possible values are `all` or `error`. Default value is `all`. |
| `TZ` | Set time zone and daylight-saving time data. Possible values can be found [here][tz-database]. Default value is `UTC`. |

## Disclaimer

This project uses [Duplicacy Command Line version][duplicacy-github], which is free for personal use but requires [purchasing a licence][duplicacy-purchase] for non-trial commercial use. See the detailed terms [here][duplicacy-license].

## Issues

If you have any problems with or questions about this image, please contact me through a [GitHub issue][github-issues] or [email][email-link].

[dockerhub-pulls]: https://img.shields.io/docker/pulls/azinchen/duplicacy
[dockerhub-link]: https://hub.docker.com/repository/docker/azinchen/duplicacy
[dockerhub-size]: https://img.shields.io/docker/image-size/azinchen/duplicacy/latest
[github-lastcommit]: https://img.shields.io/github/last-commit/azinchen/duplicacy
[github-link]: https://github.com/azinchen/duplicacy
[github-issues]: https://github.com/azinchen/duplicacy/issues
[github-build]: https://img.shields.io/github/actions/workflow/status/azinchen/nordvpn/deploy.yml?branch=master
[github-releasedate]: https://img.shields.io/github/release-date/azinchen/nordvpn
[duplicacy-home]: https://duplicacy.com
[duplicacy-github]: https://github.com/gilbertchen/duplicacy
[duplicacy-azinchen]: https://github.com/azinchen/duplicacy
[duplicacy-license]: https://github.com/gilbertchen/duplicacy/blob/master/LICENSE.md
[duplicacy-purchase]: https://duplicacy.com/buy.html
[duplicacy-forum]: https://forum.duplicacy.com
[duplicacy-storage]: https://forum.duplicacy.com/t/supported-storage-backends/1107
[duplicacy-global-options]: https://forum.duplicacy.com/t/global-options-details/1087
[duplicacy-init]: https://forum.duplicacy.com/t/init-command-details/1090
[duplicacy-backup]: https://forum.duplicacy.com/t/backup-command-details/1077
[duplicacy-prune]: https://forum.duplicacy.com/t/prune-command-details/1005
[duplicacy-check]: https://forum.duplicacy.com/t/check-command-details/1081
[duplicacy-filters]: https://forum.duplicacy.com/t/filters-include-exclude-patterns/1089
[duplicacy-variables]: https://forum.duplicacy.com/t/passwords-credentials-and-environment-variables/1094
[tz-database]: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
[email-link]: mailto:alexander@zinchenko.com
