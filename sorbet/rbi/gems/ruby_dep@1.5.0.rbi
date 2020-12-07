# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   tapioca generate

# typed: true

module RubyDep
  def self.logger; end
  def self.logger=(new_logger); end
  def self.stderr_logger; end
end

class RubyDep::Logger
  def initialize(device, prefix); end

  def notice(msg); end
  def warning(msg); end
end

class RubyDep::NullLogger
  def method_missing(method_name, *args, &block); end

  private

  def respond_to_missing?(method_name, include_private = _); end
end

RubyDep::NullLogger::LOG_LEVELS = T.let(T.unsafe(nil), Array)

RubyDep::PROJECT_URL = T.let(T.unsafe(nil), String)

class RubyDep::RubyVersion
  def initialize(ruby_version, engine); end

  def engine; end
  def recognized?; end
  def recommended(status); end
  def status; end
  def version; end

  private

  def detect_status; end
  def info; end
end

RubyDep::RubyVersion::VERSION_INFO = T.let(T.unsafe(nil), Hash)

class RubyDep::Warning
  def initialize; end

  def show_warnings; end
  def silence!; end

  private

  def buggy_alternatives; end
  def recommendation; end
  def recommendation_msg; end
  def recommended_versions; end
  def safer_alternatives_msg; end
  def silenced?; end
  def status; end
  def unrecognized_msg; end
  def warn_ruby(msg); end
end

RubyDep::Warning::DISABLING_ENVIRONMENT_VAR = T.let(T.unsafe(nil), String)

RubyDep::Warning::NOTICE_BUGGY_ALTERNATIVE = T.let(T.unsafe(nil), String)

RubyDep::Warning::NOTICE_HOW_TO_DISABLE = T.let(T.unsafe(nil), String)

RubyDep::Warning::NOTICE_OPEN_ISSUE = T.let(T.unsafe(nil), String)

RubyDep::Warning::NOTICE_RECOMMENDATION = T.let(T.unsafe(nil), String)

RubyDep::Warning::PREFIX = T.let(T.unsafe(nil), String)

RubyDep::Warning::WARNING = T.let(T.unsafe(nil), Hash)